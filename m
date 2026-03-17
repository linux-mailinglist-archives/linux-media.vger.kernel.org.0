Return-Path: <linux-media+bounces-56064-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLx3AIdLuWnG/QEAu9opvQ
	(envelope-from <linux-media+bounces-56064-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:39:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62E2AA04E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07A3430DFCC7
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FD33BFE23;
	Tue, 17 Mar 2026 12:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmO/sj3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yra8BTXl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91653C4548
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751030; cv=none; b=b0zWgZOXGC6cqE0zj2a9D4S4b/EymJFGf1wHIwsMK7Oe89lVcsrumykxVRk7vNyCOhPgi1Jf9tUFx0i1YW1KkidCKLRHMFTNFFIrldKkRYr7rxyZ4XzQBvOXOfW20HcRUtd5pfxSOoISxQY0s4eRICX9ShqdM3aHXsKFLJdmjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751030; c=relaxed/simple;
	bh=nqRqIi+jvufKkw75OxFFSCYXELMLBnMO78Nq940C9n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bs4HXiY+unP2cztaZdqNCKDWXyCyK1dnladCdBN2hBwEufHfMQU5tf7biUItOP/ec/u/bK9Jt2PgzwqU4zDA38Sa8pCO9Gt/wzxSkvZ+yVNX6HF0Am6jdVwxhIj4yd9v6KlyX90g56Ki8kNvusFualEKZjCM/RnMjRfqpFvxMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmO/sj3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yra8BTXl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HBllaS1025762
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=; b=XmO/sj3t3Y3Lk9eB
	q3EfuwwWyzi7OEkdbG87Wn2GB1KSu5TYuX0k03qktPRxopfm3zmhxao/7ZIMwmn1
	Pdcu/ajsEv8IDALv94CQKFzuwRHHt8Jtd2xG24EBUjbDqQEerzx4U/8MJRn3ws8K
	tHrUQuBWudy5Hi/zV1M1Yn7GMVRQF8/4/LSwzWBOSzbBotYJS/4I1gYKm98x5Hng
	PZBe3lXNqHfIlb5O0sDRmyptu12tm8Z0eSFCJXjoSPyoyg/1weNgksTJ/B27HFTu
	AOPiIFQI1FIYfrg7HatQ5ajf4DeXDNdRjmov/baKi/uAR7CLIbj0djzmkPa0fT08
	qJ9wFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy6d6g57u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:37:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so489484885a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 05:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751027; x=1774355827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=;
        b=Yra8BTXl9NP9j1dD094nWGqa1wiTabUkf0CrOdi/obi1uidQIbL5flDwwXWCE0lzAz
         p52l6qouqdv5A3ZBY6SZEyXcf7ZuBm09QY/Y3zjHV8E7NukQl29/v5shLiMdJP/KU5So
         lB09avh08aQvdIWapaWfWmcW5IlEV21SsoHH34BDYf9vrgCGVvlImNFoLZWCDtZE3stE
         mucXcdT0TnR2W41RFaXgOUwXp10ASvaHlf/zYW+SxSpW6ZwAzxgewqeTCdRZ4wluj/Qv
         aQ+SHF8HuCWNkhv/61uPd5okEPh40EPNdos4FPh8PJqe6JUR3Ff5g+tzeR72A/i5oGbn
         mhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751027; x=1774355827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNKThL5ekX33vFhWbSIGnt3ouNCaPWeTpYi5NY9vXuo=;
        b=PgdpvR/f3JiC6SXMHNXonzRVrJEBulBAkLPx9yLveaV41bkwqp1Ukg3aMepXC1Vz2X
         m9NL769EkX3CRHTlwHjbyo32y3G37NtyQdqbM2/ho5dF4EEe9EPDwO+yPcvHbRq29NQk
         2jtkUdCWGlI5U98i6PwcVrTY4phQ82YOW8xSyuPYUGLtH62e2slSii3v0FkMne2QwkdV
         +pOcX3jLmEN2q6NbApd1V1KvuhcM7+fW08NIHoCwY+Oy0+sM1BqZyIEO5J3c75tX4/Pw
         56Kb5HqtYaT7YpX3fCLZgLrSvatFJFkzplk2cZu/PT1J53dh/dTQVaswxiBg9lhDRO9t
         yMbA==
X-Forwarded-Encrypted: i=1; AJvYcCWT0ur5o2BMjbyBzgsbjHU5vSGThzMdy8p0rZ/f5s8L3pVW2OC7l/7Q8H53y1hZxOgFvyHdZsrB9pdzWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3x0nBaPmeLBAkp406KbMa5ITqT2Ps4Bmr6WOcxKZV1Gz5533X
	0jN7iQ+KHGYwqFTAmcjVVHqDtbZfGfS6o6p2sFOwfwYA2yRsbbT0+Hkg/1+tflp5zJt99Q70X/Q
	qeC9VdYozqq1XjraVsnp6fQfmov7yDIrSZ761vIJ13YJjJcBHfvV++Ja4RTL+60rp2g==
X-Gm-Gg: ATEYQzy3W0bBR3dgY/HPFtghfUWZ8Bj59TmFXNAGlZH9XKWvA3+A7tu4I18dF6UMzV7
	Oj5VhLHifXkiEzFgAVdK+qX7VWPi6pQAN+j84YYEwU9khQeZWcsnE3OPnB9FyiIsBO+75FK+TH+
	brJ7xZa3QjD0Bk60r02L8scm1wDSvakL3RUNzGz8ICRZSihjFe6rTVwF6CS1jch1/ZQKCaOMBZ9
	2/WS+PG+iVQtyKzKUiqlvE7U7tKdx3V2Ua9sxdpVGdqR525Dxpa2UxXIL4jFB9aFBV7wTclK2Ry
	LrUfA8FNENuLKK+ukBCw7iLk2WunS1Jhsz/t7rlI9gDlFkfIzBGDLtGq/vO2WJi53ocNIcQcahQ
	B+1kRJECkBXgipunotUDXfvGFab6lw+cTOULpkyVQTV/s
X-Received: by 2002:a05:620a:488d:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cde13519c3mr367925585a.16.1773751026934;
        Tue, 17 Mar 2026 05:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:488d:b0:8cd:8fb8:7ddf with SMTP id af79cd13be357-8cde13519c3mr367920785a.16.1773751026419;
        Tue, 17 Mar 2026 05:37:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:51 +0100
Subject: [PATCH v3 2/5] remoteproc: mtk_scp: Constify buffer passed to
 scp_send_ipi()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-2-4d7fd27f037f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nqRqIi+jvufKkw75OxFFSCYXELMLBnMO78Nq940C9n8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUroFKSbIBB5RlA3YpmmRSHYAPZ+GgxIjOsmC
 QsYaMdWGFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6AAKCRDBN2bmhouD
 12hlD/0YnDGdPlpE0996CUjdK6S6A5CItE03o44wrGUyTdx/aJRs22HNSeJ6/pyD/SmdfXhWvTB
 KLWAKrIHpmKelvllJxz33HEocqtPs5NwMHYWhvgc5mQyTMV1NHG8kLJtaWou8HjOLA2ACwlxUmA
 hBK/v12MZcH86zSZE8fTbI7d6JiJ/CmXZ+TQA1oYo1Hbw/1Vbhjcr1wFxfIlWW2lhyhcLYRpLSm
 eFnjaGHQB8dkSsgkc7TP1jIHbtzhbvG/IQSNct/hnN04YE0UDmSkQhus4GLBs4xq4uHoWcYocIW
 nPZ13IczlU8xGR/z+nyex6QI9+GeMW/luu2wlDj6fdva7aYkKboUXCf5YS8IzINRV/RNUBgVu1x
 Arpt/ozO6wmnbV/EH8tPZA/UqM3ALN3TALJzBcZDfwNgSvJFIVbKEwC7RGZVJ4lr90cql2RJx9h
 Ny6lZtwQh39CyomEJ1rudS6EzgzpOu+fOIYWFTQ6a9vEuySpjI7wMln+UjS1KKCirFKOIYML1Bi
 nwUtYVqJ0USwP/nrzswexqDRQzPQbKwX7n0s7kCaTL9Fs7o/L1nvbTwELOsC9i93GDUjiYHJdmb
 YNp5/JPGO6sst9r/IrxugsSGSqNfovrLb6XXM6hU8wFEtWwvatS44GStvbDGVDIsKACdfSXCPZq
 gQdux+rBFoXhBdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfXySma3JxxKw7m
 eBR+mygb2BHwFf+vV2JellLjy9mA2HKPxqdhd604hK0+O5V68UbvrvSMv/dC9pH+JOwd2iz8/gs
 rWi/lcfrWtvsjKR5fzu238lXbpxae7IzbbqCw1zhEvePX6ty6HWurUCR53E8Mev1LqpYFJSOlGn
 3wrnTtxR3GxrN6iX+JUa0U4LUly4w2z6Jkn0n9VBsnPh6FoXwJjCLJFO9x1Gfvw5uNRYg6Vc8o8
 VcfrlhExkuGaaZUpBeqdL/fw84Kjfa5M3MIUvPdJBDxkOumdkCtYw0aHLqXHTIAMbZMVItQhDP5
 hID9xf7wA1E6yYHtBvKfjwaptT2vSNNuLajR1xCCPTD+v8j3HKhhDjq11VGixfk9s66S27yXDJv
 6ov5U42KOhwww0JSudqD5eAK2Jrj79NayBJjkCXgxl6WCwqqL1a4+GTCfPNsCEgYWhlTN2lBWz+
 nLiFWrG8PhkgSmxA2Hw==
X-Proofpoint-GUID: F5nEm35qG4jecNn8IzDZ6qfi5GxMQaOG
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=69b94af3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: F5nEm35qG4jecNn8IzDZ6qfi5GxMQaOG
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56064-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5F62E2AA04E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bb6f6a16d895..85a74c9ec521 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1078,7 +1078,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.51.0


