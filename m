Return-Path: <linux-media+bounces-56067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCy6LihLuWnG/QEAu9opvQ
	(envelope-from <linux-media+bounces-56067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:38:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D362E2A9FEE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C77623014A19
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A793C3C03;
	Tue, 17 Mar 2026 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbKAAK1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Y6yPHb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6B03C1411
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751049; cv=none; b=bhID9vPj5g34ATwpL5T0WbL69jjsi1JmEx3BNrYhFPW4PWEvO3yDU+jrP2iWWwgexxQk+31SL9UyzNB3O2t+zbtNajJIx7WOAjgmqFxCAQjJcWzPsd9XZNotmltWsFO9Adc0G4mIgc+Y0aZ/brKPSguhoHZnr0RaXMncIdA0wNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751049; c=relaxed/simple;
	bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8Snb5XOYgPgQ/Ncmee2K/5INy742WreDm7B8zscoCM8yGhQNBhb9rySEOrYezoWVZFFncYPMwr5M/6yevGzpAAdt0bwnArUjRHLRhoTa3uyg/uujBM+7Ef1VEhfhSk/D0LQ7vr9LhFHYDcl9BAvqDjcy1EZzLF8FO+1XrWlh3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbKAAK1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Y6yPHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBleLu1025567
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=FbKAAK1L3AL/kMQL
	f+JgJitK6FzWufXruPRpNmpR/N97YYfGYs+qhXsYzFWU/djN2twZJQc7qjiTnnBu
	qTt5/eNxB3b/2vLfotFc4Y7XuqM4fHblNM4eierINCK1B4jabTQSbKLsrurGjciZ
	7aGfFsUvNSX4w3U09s76lf6h6x0DvWhcuaPILTyPGruHE/f0kP2huBNEhON9uZjj
	gsdq3+4KSJiBHmo+66/zT8vLQqawfThkN3wqsjpcczFuFPKRoNwmgma/E8T0/rAE
	6VSigu2z1dUjkcakUvTmm5MFDPQuW9wFV/GvxZg0QGiyrhCJEYOSIH83YJBphHZm
	ukS20g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6g58k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80c4965aso497218185a.1
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751034; x=1774355834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=V6Y6yPHbF7qZedlpzkE+jtJ4gX2vtiE4pPjiGjBrwX9OXXT817/uSlHQZcrP5Yep2u
         6y0QNqBod0zJTgFhua0Bs3R0U2c/u1hr4hEUhn5zofDKY7UegRSGG46SO9li/7qB4un9
         SvIFOKeNHCKAbSbKf0iFmzu/DPIeDHW3Hnx8YtsX7JEhZxxg08fPthVhlAszoktYFr9+
         y+WEOSVofxQRyFhl4/oXvrUcj5J69SG0IECoUz9ncx9wYSz3ShIxMgJuwPfBT5qSD08w
         XZ4omKn+/AlI/T180ynFeTkGM4MPbc6EzM7y0s1s/mIwqh19Bb/38i0yw71+UP3MSiTU
         dZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751034; x=1774355834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=ZolSIL+zh9bgoKgWGaoOI9ofY5Q+CiVfKXoPRdljFLFTyQrQjH6tvQukeeZ2hj0GYJ
         4lsL6cbN1QrZMvxw99o6xSjWRtrY1DWwMM2IGL4AIDlJTrAylmdoKYvyWAbOGmjrUrLe
         Ob0Lr7AGrAATHiEFvDll07ezQ44rgVnhzNYNiFn8ZhXne0FtI8yneztJy0V4GvYMuG2/
         75lhM1+1xrwarEQ5NTn2U/qSC+z2jc0ffMAHwB9ZQn4tAJ/vwt9vFx7eWnb9DZjNhA+k
         qtBVQ4EqKCIlBrS858ygDAA5QjEur/FrXz5aFdi5FJfOT0xfuXX1C7D2unaN68FECKlj
         1QWA==
X-Forwarded-Encrypted: i=1; AJvYcCX34SZRmptW5zpyWv2nrlfX8SkbgmFUSP+FAKcdBaKUHMICw+aBiTr+Gw9fJ/aUB24l2R8Wsp5z4gOj/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLKauCCCcjGSmDvLomF0R4JAblyqiGz5+KhQ3cv6eXlyg1rTml
	QoTgLROa1Rz7f+ZLX3TEwC5fHIZtSjw95VWy7nk8Ss7uq3qyJH+shYmfUDQy59HZ/lTislwqwuM
	KVDlRflLFugTPgPT9wrc2SFJQGm7Zi9aG8xHuixZF8P/0gYqfYWGiLsP5kghHXr0uELtbL9ctBA
	==
X-Gm-Gg: ATEYQzzbXfPKHxtsuP2nUD+VqFCdFAKz0bJA9ElCR/audObWxXJIpRjy+wFF7qmpj0r
	pq371EWzQXDeKw3bHoTEd+FhnYwZ/3XxH9gXOSmqgaf+gaS86tupYF/4/n61cLtjvxoL/bl5916
	GSHMHldiW3CTYV0nzsxfKCr1vrSBG1JclX+ub0hk7G9nqWYL1jlfzvrNmkSuzFjJC6Qb1P8tGcF
	CziyjwJSCyqUKYHdN3XRpCf5mepqfLr9rDBRcMuR1IO8QYEc5qKji4Ei+D7Qgs4IbhIEOAQyGcg
	laiavZxzmejyW+he4lf5sYgKxnjXhd/14sqqQUUdy1sKVqsB1/h5Cs1bRV6jLtMXIMDAilHAA8K
	QjPnqRIT5xGNuteXGkaWTu8wmqI8Ajqa/2sM9VVePzQ+y
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379626585a.6.1773751033818;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379621885a.6.1773751033207;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:54 +0100
Subject: [PATCH v3 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-5-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrqgmtdERuN3F27OHUmSHYeKw5e7+/d1vJYu
 lQtMLR4gguJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6gAKCRDBN2bmhouD
 15jcD/4/Gi4pOzQo6bWmArEEKAEmKpSLeGaLTVR6yuNG8KwvwphE6E4w2Yi5wy5L4TV30U31R2I
 Cku6v9OjiaWcvGVp2wSSpAkv1HMyqXkUqKM3VHfhP6RHCCNEC8TLnAiGUnDmcYZ5niVVFzVmw8m
 v/1WQa9G1p2v/jzVM3WzKfga6U5SoFezZzU4cWQbM8mJUZUZVMjwaeLqLMyciB80jz8RDRSN24Y
 COQyhl/3m/c1wL8pNJDR8QkNDDJ1GdRmE/ege3JxLwdsVSez4uED0bXNsD53wFk9/9mC5uNOzZy
 3oFPRNIINZbspDiBrcbP8d9229ebKfUr9bndPzjyJbjoLLmHbcmghV90ZlFbO6Gs7b0YxYQW3lK
 VWc1iQJ4PKJ0ocO7WDxrztmD7MIHbH6IepDsz4MPOhFdalKDCrDXa0CfC2bSI1VFGFy2VFAxOBp
 8BGEJmqzGF4zhrXoSPG/6sIoRxAqlGYbCccADWHJClI5JBUqno7bmssBht1lTz7W3+Rs/5ILg1L
 zeQ9pis01EF8YVgyfAXkwrlU+HDue1nOXa21u1ELAm8sWnPWYD9AdR4W4TlYC2aktq5E9xaRTk1
 ZQ0zROlLiome5squwaqzQd3/PTC5FhHbuVFHq1nOwR7UoCDxw1FTX6zYgvjV4ALFXnkbevg3mZC
 Dr9djLjyQVcSO2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX1NZJbGoQ8KG1
 dj0XPef6MdyyLlxqgvBwcL/uQVAG2TlFNT2jiaeF/HX5BRVHJCnklw/Tb7WkwrGJUP7KqWpW8fJ
 goCDvGmLH7ocSG8VaZ71HEz74B+00gCFlehq9+WlGxV9ocVtcYIVh26QPjyKeevkJ4hkXjtsKCO
 yv+mMk7d8456mgvXDhhEm1jYovbJbtVgxLRvFXyAHTR++/wooDXfCPqdamtuhtR+wkV/P6QZQ+X
 4NaQqmAHGMchHFUWnQVu13f1g067otJ8VXQwEjgOY5FhDHJmBUHRDxxUh70HGCEjiZyFZmFeJue
 YrCq9ajN6bFpZctrHsUpqZBTBjpIc7LNJqTgq6VUvVO64NKSOKox1PBRJCejjEAM7nXaJmVrfhy
 D6GkOylCSmDH2ThrPPzrkJIFESwF9o8Ds+ATwncHh8QE+Wt5+ODDFB93LsX2zhwEq0XLjyQLyh7
 WAB3TrklFhYnvY8UdWw==
X-Proofpoint-GUID: YbpqRIFNmJTl24VSukwTiKVgptKCjAOn
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b94afb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=lY2TEL3CVMzQJMwj26oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: YbpqRIFNmJTl24VSukwTiKVgptKCjAOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56067-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D362E2A9FEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0


