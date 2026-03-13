Return-Path: <linux-media+bounces-55775-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GyvOftqtGn9ngAAu9opvQ
	(envelope-from <linux-media+bounces-55775-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:52:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E128975B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 20:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9789330131C6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9651A3603C3;
	Fri, 13 Mar 2026 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmr72iyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOrVYQRo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63823E0252
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773431526; cv=none; b=LRScNX//ErDfxwDFnpI1ja0teoxRbiq6sevxHUK4RmrJ04vnJFEpgIVIEGElVmQRtR9nf/qjeNIucVTTg001zWLLYMAMyyR1MX1ZHR3lh5IgpZW5PetNjUpg2KCZJpTNzxpIQC2g4WbjMESLeynOQ0fNcXqFkbRy9BcAFP88ZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773431526; c=relaxed/simple;
	bh=RGNYsDHHNfShLv/xZD3iLjvQtvitFFm8+m9j8/SqbpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TsJ8WnE9DxfJtTGWhNolUa0DMm5JMkuET6M+AqCem9ze6MroNWHz/BAV280dZHY53NJ7nJ7s8Yu3nXndY5KqxgEYwS/D3JE1S0Eqh3B15RgtRwqqVTm1r3tc+3c81X8R0RP6stXN8cNjcD+IEm/OMqAvTEBp5sPwD6AwXAzuzmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmr72iyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOrVYQRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DIqjeR532963
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gr9E5DfiexT
	Ovtee35m87lxhGRVlsW+KaUZHlNYJATQ=; b=hmr72iytzDIa8GNizZ7Zx2t7vkS
	3FWdQIX6Yr8v9gvCWGQUvPtfIrLTTl/CNI5lgcbAfk34m4GH+283y/sqtcN1Fkhs
	TQIZJaX+Aqgg4nW3iQWNjP++uRtPJHK2PAoe8c1iEzVVyKWqP7F35fknMbRdqnF4
	K9vk/88JGMRs/g0vJHPI/4lRhBdCIcjOvK8DSPEGsUWTyc9hOeIlTe12P8MtDu1h
	KZ0d/sxhSpEG29txN7UtSWRvRVTnlLc67k1yBIiNvWLAstr6gy046fn/Utik18rm
	S19LjWVuoNZnxrXg09oLyluuuy+5nNGbFdaKR7lVZrrVQwGB7hI0NqYHZYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84svcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 19:52:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd781c0d90so1955915385a.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773431521; x=1774036321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr9E5DfiexTOvtee35m87lxhGRVlsW+KaUZHlNYJATQ=;
        b=eOrVYQRoOoHIyenciLrIVXgLwArfOX+ZlfRV2HD9Y54cBKCxpbIjgXncRWSvvSJcDQ
         l6PzlFZlGZl+J3Q6b3IPMud8LvB8y3RScQuxg/+yZL66U4CvLP2Nr58fVMGFFoWsSllX
         9VAroo90m5IxBhKiikTNJ8lO3S4qDuXPLx/Mo10KMmF4WgU4oMAz1279QCD1qM/SM9Ac
         jVrSncpEVG5Pzi8oZs8IQYu3wrBGvSgULb/zERhRKLG/SOWZZf/loQlAGvybX+0jOaLl
         dVRo/3TzZxjSeDkUGqdY2j+ATUkIF5ubnETNwmDsKxbSfXunKl3DUXFRhiuHo1VmcnwA
         CivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431521; x=1774036321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gr9E5DfiexTOvtee35m87lxhGRVlsW+KaUZHlNYJATQ=;
        b=nILvwQggSONemIXS8bB2zzzi2pXTSsfWP7gZu8nYkj18YkppcsMZL9Wx/saQmAnv32
         LDfYnU5lGIEvPpO4iJNxyPszQ35LnQP2NSIQJvjQfYcrTJZU++AL3xEtJHqmg29JY6bF
         3vh7IzNdcMEKH1UKJjk3ZmREM6djk5/jVHG/cKjUi41eoCYw8hPRbt6HR6kP8MpY/nfj
         JvR/C1fPI9QvHPXC9El5tC+nygu5ZUmhbh7XWw29pIBIgty6IqkZ+cqZu0DgDek/cy1Z
         +WdsEwtIsf1RDA77voDmtaTKIiQzEY8u/SN3g5L02TcC6FQu5K6lItOvCboOXuvEBopL
         OOcw==
X-Gm-Message-State: AOJu0YwuO8SOaQt/mtiBVpjDLEFMB8haSs3EP5DpaKMK1ob+mRBpHdc3
	i0vs1WAeq74N7oDb+g78svqDFx4XOeuNSaQtBsbOrHmYMJqYrA58I/pATwibHXIpswqrvdgeLZI
	5tIuYO6WF+4wgXOv1cojQfWhaQH7fVav32Q2GhEKM2JRg6x2zxsrK3AaQC7InzONGSw==
X-Gm-Gg: ATEYQzwNv688FMRkuUjyQKnrCCoal/39l3I9X+wnhc6iMLrCazte9kLAUopEexPozQX
	2BXW6GlspjDPBgC5U3EEE/PWl3OvBj/nHwjzTyXqGqQptRM5yTbivymNXRM7Nc+N7t18XqqOMzj
	lb4nimkmm120XN3URICAvQtjfT9TCakXV3tCy8z25KB4fnnqcKKTIa7uwRk4N2dQZgTlQzlzguF
	4vNYEBLxlwYrmpis4BTO5QrW98LNu3lIyLZA/gAqsY8BZ8gYOb2+wEttBJJj+8TwY0hTvebgfEt
	MQ84jaH78AVW8hOFrZde3Jlj00vvxGIBnVvdt96FxlMDix/k7d8X8B6OEHJo6bNyMUP574XNmdo
	rwzzFIbItj7wEuAKbvTYpEaz3bzQL+2zLIZOESiE80IwMSJcQI29Ddv9uVI0eoLEsjeepAtndmG
	pnN1+wdg9uWGFI
X-Received: by 2002:a05:620a:4514:b0:8cd:9300:c864 with SMTP id af79cd13be357-8cdaa88a14amr1067583485a.35.1773431520862;
        Fri, 13 Mar 2026 12:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:8cd:9300:c864 with SMTP id af79cd13be357-8cdaa88a14amr1067581285a.35.1773431520440;
        Fri, 13 Mar 2026 12:52:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:146f:4491:fa7c:17d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm20112060f8f.16.2026.03.13.12.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:51:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 3/3] media: qcom: camss: vfe: Make PIX BPL alignment format-based on CAMSS_2290
Date: Fri, 13 Mar 2026 20:51:52 +0100
Message-Id: <20260313195152.275196-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
References: <20260313195152.275196-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b46ae1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KTbTtSzwl6QXNmdirioA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDE1NiBTYWx0ZWRfX0RddEBbuNF4g
 YMZXJ9tKndkNJnoLy3xSQcMpYsBrdTN8Fnxk4y4rNrwhH3qYrVqR5/xnc+QP+0Pc8YGHI42koIU
 vZnIFw7XXiWFELoy0/r3Vp9Yi9xiDeIPq/TthBlEnAset6y+Vul6rZaoDnijRIJQgSty75Bs9pn
 rKc4kcW5JpTBUUP2S2Of+8l+Imknv8PkPV1GS3BZUpWX/6E7LAR9zmmXE3eazJZa28pjcU3rbob
 qDrWaTx1I47Hw3wxvdn9xeIO4RR07BNvC9cGwbEPanzVHvlk0Wk+ANp/KsGOSxDNgvSIXqhqHSW
 mker/qNmgZbFNO3rLTiQqdFJHAG2BY3AHhbGCLQ0Q9KI8aRdHiJZAaQ/gNhPtULIXUYeUDplfDl
 AkEzAGArhFv5q1VyBusJwAYxfZyJwAKioQQeuO460tBQHu4iqn7dV5pRpg6owFIZkA64mqQfNVP
 LI1v0q1JPLxnBqxVIQw==
X-Proofpoint-ORIG-GUID: t9TOFFvRGy8S4UGor6qsQkbTn6j9S7Ya
X-Proofpoint-GUID: t9TOFFvRGy8S4UGor6qsQkbTn6j9S7Ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130156
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55775-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 047E128975B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Split the VFE bytes-per-line (BPL) alignment logic into separate
helpers for RDI and PIX paths. RDI is usually aligned on RDI write
engine bus constraint such as 64-bit or 128-bit. But PIX engine
is usually (at least on platform I looked at) based on pixel format.

On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
alignment must be derived from the pixel format. This allows the
pipeline to use camss_format_get_bpl_alignment().

For other platforms, retain the legacy PIX default (16 bytes), until
PIX is properly tested/enabled.

A future improvement would be to remove platform-specific conditionals
from the VFE code and move the alignment requirements into the
per-platform VFE resource data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9c7ad8aa4058..c174c7d706e2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static int vfe_bpl_align(struct vfe_device *vfe)
+static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 {
 	int ret = 8;
 
@@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	return ret;
 }
 
+static int vfe_bpl_align_pix(struct vfe_device *vfe)
+{
+	int ret = 16;
+
+	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
+		/* The alignment/bpl depends solely on the pixel format and is
+		 * computed dynamically in camss_format_get_bpl_alignment().
+		 */
+		ret = 0;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -2085,11 +2104,12 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		}
 
 		video_out->ops = &vfe->video_ops;
-		video_out->bpl_alignment = vfe_bpl_align(vfe);
-		video_out->line_based = 0;
 		if (i == VFE_LINE_PIX) {
-			video_out->bpl_alignment = 16;
+			video_out->bpl_alignment = vfe_bpl_align_pix(vfe);
 			video_out->line_based = 1;
+		} else {
+			video_out->bpl_alignment = vfe_bpl_align_rdi(vfe);
+			video_out->line_based = 0;
 		}
 
 		video_out->nformats = vfe->line[i].nformats;
-- 
2.34.1


