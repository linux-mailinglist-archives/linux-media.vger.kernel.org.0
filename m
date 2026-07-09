Return-Path: <linux-media+bounces-67180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9p29BDWpT2oCmQIAu9opvQ
	(envelope-from <linux-media+bounces-67180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:59:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D014731E3E
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:59:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YJrYdGpt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dkvte+lO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67180-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67180-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29A6F30E65F3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1AF37B025;
	Thu,  9 Jul 2026 13:42:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C96A375ACB
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:42:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604568; cv=none; b=b+9fMGfuSKXBDv5+5zTJTeA8yb7xULgWadB2pDfhsCG3NHqLQppWlK+W96Bp/rS2REl96mS/NHFrMurNMP5Uj/nRMVx9CTj0+pAIid4L9ou5HHMmcf5Bcu8YiGbIv10uzKlollwn7Cu20wvTT6BvE/hzJHcZb6JRQ6XVZdvg2fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604568; c=relaxed/simple;
	bh=vGRslm2JgjUZbf39BdYytwE3+eFrdcsP+klQMQGIL58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5FHJRRz0giKiMkxcvdwB0eU05OY/AOu0k+KRbJN/h1E/Z7yo+bTPPz2jV9sl0cHGeZEbnGPhFJrArXf6VEQ87ms6hRwryuBsBn2kTIR5mqDizjCyVyh9pJnjezVOkLdknTbzpg5RkLNWofRxtEeB7Y8MklNCU3cQHNJxHxEGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJrYdGpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkvte+lO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNCKQ1537264
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 13:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IogRU0EgGYzYk36Cve7sEfmgGtlaDVqbv2PiTmYhJM0=; b=YJrYdGptpldFAZpU
	ju99QwaPUtKDdzT1YP8ZayZpbVzxIQ4VREv8Uj7vG0ZawTMC0YA8a4X1SyEKIHP/
	izaEvkiPEl2Y6oUMOifqh0Ec/FIjUB0CQWXJW/Ln0BliC6SxgnYD2GfgrwhBe1W4
	bk0nqhdOUI9yhA9UxpAqNIzOPs6k79LFh/bI+bsHcCOWoeulyFU1H9bbbX7v8Yba
	c+INB8Yai6EtXqQ3zIXyc3T38D4g97WH0zr4H8Hbuj1mdmysSAqj419xggHByox5
	4JWVXcOZxhBv08gT01vIVWOZ7hzDtvczkRdfZv7Zc8jCu6VTDSnzgqqFwDrzcA0/
	zW+kCg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydtycf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 13:42:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9693b69c4f4so837092241.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604565; x=1784209365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IogRU0EgGYzYk36Cve7sEfmgGtlaDVqbv2PiTmYhJM0=;
        b=dkvte+lOI5xZOue1mJvKYKjgmw6NuC8WQ4OlqFmLUqPRBVFKWNBD+fI/iwi+nFGG9O
         0DWG7HltsdtPTSud4CH1XS53708WhIhlPgcSkaoeZhv+ghUEB43Btge/T/cE4MQX7Qx3
         /yK4H95hBnA/l5W/zRcIO27hkDGjGlgnK/QW8bnZrYcjwHdX+vYa2uAPOpzbmHjZXKLL
         xe1ApJN9yoAbqoNZgZJ+1QwtfIpxZQXbgj5YGy5/mshCz2honpa/o14BDYkazVCYYsk3
         MQln30gaXv8Pzbd+ze1LlhhJmfrhxY1tDmF7ULS4x8a9IfUkDqkO+QfR2FxBwKseFMn8
         t+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604565; x=1784209365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IogRU0EgGYzYk36Cve7sEfmgGtlaDVqbv2PiTmYhJM0=;
        b=KSLsVUHrovaJBG3XXd2g2CwnJ/yUDiwdmIyT6E7wP9eq+ImfSW8dw4LqF21TJaW4r2
         LVPD/jkB8sD9mpyte0E68BYQjgdqEovmjMddq0l8RBuuEcHCt97OWsucxbJKYWSu1Ocg
         52udjC4rnIf3XxdUASnabRLX7KrnWUfQjzQ3Gq5Yi+tK8GaTv9Tg6QgFWbjKlk4c+InG
         rj3asSfrIguy80a9AYTpI7fZMZPV/JSzIR/Uc6uBJjvtvcRU+r/dlehiXEl9qUFLdHg5
         F23w4C33YBJvZ2brFA8L3YpSROUgELAIHXDXDeOplVwhBlN3313KvHymLOafOTgrYGS/
         Nqxw==
X-Gm-Message-State: AOJu0YyTmrH1daP1V8U/U9ysmcFxgpL+d7a3QfvOnG4MGTSK9XeJiSVK
	wNCv1Dw8v3rHLZ9X2pdd1038k1Q/7I0sFD3Ii+tIe0EfwmFmOmjYx6VRIwA8uMSR/4XsuC4a1qF
	pB3Gi5lc1GIstHLtOxBI8ZsiKM7CLWiIthO9KsQvh5M/scaAKFd5Q59l/rYOHiW/KVQ==
X-Gm-Gg: AfdE7cltCCx9YbOLkwzfof3nGabC87+ec7azn6Gud4A0FJV8n1kiej4LW4rBPSMjCUd
	bsmJoxRXQMARbGX/UQfZFDAKHf44SKWgTHnJSuQjydzDpb20r+GxKjCdpwwqS/CrHCLMkGOtisL
	VFrBQCRQ7L3g/CfYkpC48bRvbEs8cabtPiuPLB5iSxDCjhx1gR5cGuk3AgUw3lE5VWbXSvk8y9T
	DsxbAHlY3nW1dkIDi3M3ohlnVOB6k/DJLmBkIze5pgOH4/K4xe+qyg7Fj1vi5RoihKx2rrZC2nO
	u9U8pw9sS3lH7Sj7A3g1eTUabCN3EG45a2pE/j0O8XImbqet9ouT4Akd8SnbfVK/ri0qyqlj3w9
	hDw7IBaZpdjSJgbrfDnVVshMw8iiEglWamN8xjLlw6xvVHsleVYRWPmUAbyIpgOOmmtHJ6iw9yA
	Bt5hHTMmQWLGMw4OukGxMVknfA
X-Received: by 2002:a05:6102:2c19:b0:744:d5f9:ffb8 with SMTP id ada2fe7eead31-744e00118e0mr4766135137.15.1783604564512;
        Thu, 09 Jul 2026 06:42:44 -0700 (PDT)
X-Received: by 2002:a05:6102:2c19:b0:744:d5f9:ffb8 with SMTP id ada2fe7eead31-744e00118e0mr4766105137.15.1783604563942;
        Thu, 09 Jul 2026 06:42:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:09 +0300
Subject: [PATCH v7 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-18-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vGRslm2JgjUZbf39BdYytwE3+eFrdcsP+klQMQGIL58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UmB5NqTeXRW4/wP0Bu1FZUxYKub0Fzca7ks
 xPmpEqoAL2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJgAKCRCLPIo+Aiko
 1S4nCACHTiwv67zy6iTfDqljEo9jqUZbwCmKGWM8F8T0LdMmuOsVfkC8mdCxZa7MkcHw1kSDTSx
 rgn1efgWwLvWHmfLDxrBNIoYk52llZDbhXYpfQrUokPVTKlQFD5Q5leU5Mf9Crg8mJCG8uf2a4r
 I59ptWPWlcdUXf2EaDZrOgaBAadCuN6d7fd6PswZkAF+fgSjq2jGcHrx9u+yy+GqpF2octfcsZP
 yDv7CRjbbwXWfGyM+KqhJDvUg4e2po5X+qH9ZxghLtur4JOjfb81za1Dv/DnwHCrf6TZy+WXbVK
 78ikTqHJqoPK41EYf4rSuQ0ad9NSFKYqtoa4VkYhGqLz5iHW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX44IPNPkg+YTt
 sLNtdBM6jNC/N1R+Kwfr/N7Xw8qPjeZ2x1rq200jgPYJ3fCbHU/IW8csO2jddF9JH4qIQcWQWBM
 YRwuuILvSC9Slfxknz4EIljUx8rmD9g=
X-Proofpoint-ORIG-GUID: ZM7PrhceaClv_6JZUGXi8xLHklYOxzZp
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4fa555 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: ZM7PrhceaClv_6JZUGXi8xLHklYOxzZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX1S+0wlMBTNFN
 g41yU8t1u6KJ7aY0zR4qmK+rY1gnk8q7ESxMcOffHihUFUMF77kV7SYkR7LJsBT5gZ8NKaspJnR
 lrAar7Bv4AGVinpzQ2FeVjxnUfTWIm0/5TcdQ+Qmap/5oSonPwEQl7Km1RzzCm2uAoCkEJN1Hzx
 Uq+BIH5nenkG6TUc/9sh3PQsqyOQwzaGWZ+DAsKJV+8YgmQNpNxMXyxphvLilZifPgM0pBco557
 sQnH8BW/zzwno/ctTptuuUwnT2H6hkKEkmoY52uzdQyBE/oYwPHMPZRUqCOY491T6bPVO1vBawD
 NBK6fA85uGXBUnGFGstK4dMIZ5tkpr6G5nYIWLyH69O7Lc6Xy9zOZRikaYwQjK5U/CF3GRhwHHX
 LgBFEu8d1DgbBIULtka3bnuxXotlLpP4wuf9aPVmDkPu8sXrHE6SPsDUJFPgSHuDRwpsHAQKC1P
 h+SgwqtgnX/Cc9xJtig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67180-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D014731E3E

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 60bc1339ddd4..4f205757647a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


