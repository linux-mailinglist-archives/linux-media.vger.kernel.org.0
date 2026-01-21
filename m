Return-Path: <linux-media+bounces-51190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJzJCtSJcGkEYQAAu9opvQ
	(envelope-from <linux-media+bounces-51190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:09:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 198DE53441
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D11B5525A3B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 08:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C6546AF3D;
	Wed, 21 Jan 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVlXZ9wz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzkRTc47"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C82C0F91
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982807; cv=none; b=I3ntcYn+CL2WzvOvyK4NeDN/xOPaU1/9EOiy7IEkcZ0qtirjHUfv46T1oy/p0ilfxzX1MxuzSbl9u2ppQXIos49VJn9mcvDCoFgok6rekEZqPjhWIwt/r6Q1Ws9Sqgc6rFQ9TI6yLw+F66inkLRkAn/o8vlyYVmSE5/M72MUGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982807; c=relaxed/simple;
	bh=G7YS2wlAM+w/N0JuzYh6GeMVBzn0xVZZwgxnap2Xevc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IbFY9xGElS8PkJSFJ4r+a9S94l4nYVrfFe4aCWi4+VNtO/lmbI9G3SO+wxJXHf03QJHJ0Jd6yueC/dDwmkCJwe13Q7EC+osItU1ijbQpbGYmlJ6LdhniRLuoIb/wMyeaDfiwXMX3n5CWyyg7Q2Gtee5Lb/dJGYMg8PJGTg9oJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVlXZ9wz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzkRTc47; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6XOls2938579
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hP8te74cBcaLXVNQtfhrxUlMHu9KXywfKDJhyJUVTl4=; b=VVlXZ9wzv339/JFb
	AQewjoLooM/ozl8S6V+9N0ah9bSwFkBZ1to3NkHGBfhSZKH0ekMB0sscSrjM9r4T
	f4JjqLraS7Y4641uihGl/+vWRirqPeNraJ1kXb4+cS9Nhe4Me0JuWAY2OaEvsxrX
	OWRzyeYuaQTz1NPOdHiarsBaOE/QF+Yphw4+1CYE4ipH/w3cdALfwSky3IVd3sx7
	hOy11loQ4VBL9708XK7X0m/94W21Q3rKPzmxucyyJ7e6oGa4VqOe65WWs0qJRQeh
	mqSxrGeXR/SIUGsDKgf9P5SxCnXoBaGzcKpXH8bk6MoTe+SLZJx4xS/4EugkEysx
	nPWIgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmu8a2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 08:06:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52af6855fso825921185a.1
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768982797; x=1769587597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hP8te74cBcaLXVNQtfhrxUlMHu9KXywfKDJhyJUVTl4=;
        b=HzkRTc47vAgTCZolJa10ZKb15tQWJsVIBNSTzUu2jSQwpLTRnVQpN4pSsbWxguIkt+
         jJC7UcRBrboHIT50DnubkD3Cecdg+GUwV6z/LjLFzSYEvO0rPY7h26FcqLlTRRGV0J/W
         N78aPZ9OBtiL13aveDe9Co9AP3d6mf7eGiuKlLRnbq7jLgr0eMSxfbg97EURaBO96fi8
         lKUHyAokMfMc6Fym2QJucOEbe1y0h6A5IjWc+MULdYd4E46+Ybrv5eOcCRwCuyMMkgxV
         g37V3ijtzuHUPejQX0B8uALIHSrts1QZdjY7KOgnnvLcgs0dzPGU2Ax8IgS2DWLjSQDc
         aEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982797; x=1769587597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hP8te74cBcaLXVNQtfhrxUlMHu9KXywfKDJhyJUVTl4=;
        b=eyvd8XlOkhcveH9uvILycNz5eLjTfIwrzIvPnqEu+RBDZkVVYk8DaATgVGxrzqLETA
         /oWVy/yKIN7XuS5bJyeVGWP/lOAsOPt7FGWIiWcZJU7nMe4PnELiBkXEuKe8mQ7owwez
         b8B7geR4COAeWYe0d8742QbFCcHAV0YVhwKGQr41EzB6M4REeQ0jOKnsdc5Qs1t1J5F0
         a82pbRpeWDxQdIge2UW3g5YJoPFzYA6lw9le2ZAjskSG9iLSAzTfyxDIFjH8gWzjKjMg
         Mvh+JjCjEhDz/rpyE3JBsyGGcp+zX4cfPYNEKt67HSE8vXV7IF1WgAcnXtAws4Q1ZTRw
         aVEw==
X-Gm-Message-State: AOJu0YwnKAVT46tKyun688khHQt5iBmy6MQxtcOkgMDrqS/TtDnByqsf
	Awbw11wffyTcC2egOizsH+J0raM/XUjpCrecuMx0trAPuLu6/Duf+dhiF9bxtZfWodb9WWc3VrB
	42A0EXwy6fgZ5jVPcNcREDulGTy6BIDpDVrphfCqpTY/XR2//H1vcwY0/iBAN+fSIBw==
X-Gm-Gg: AZuq6aJGoV07aTE3+43VKSeEqIvsxOaLqNoHWpNx8SzHm1e3BqijW2SVM4juVT/hIHP
	0MgTS8EI8DCz9ybd/QgxAqw72wwu4Ogd+5F/swaeyGwQaq8/36STjYex2qiwu8KZ1D7tB8Vawih
	expTP71Ha6bk+1fFZ7PUfXw0guvqvRYAEEMWaPNryyUTpNpnZFi3J6Balvgo+V45mxM/nVx3pTu
	W1Hy5uAsF97YhdYcxGC7QGDN7uEHb7qH1LzQ3LWeNuxdSzwVWBJOrlxeZz6nXHB2WqH+kQ0tHE/
	c4FFH70BEca8nJ1J0VQMaAxeoaELnMoh4/hR3Q7IjRAI+yEM3S6+Qc/N9Fv7kw6gFSCbGQgsK+f
	ESSjvWbksfYEAY3i4/Ql813ZDh3JCCsFS3f3rKK9KgysrFYHG2MDOhxnXAel90rlieQStYK9pl6
	TO
X-Received: by 2002:a05:620a:2a11:b0:8a9:ef98:6b34 with SMTP id af79cd13be357-8c6ccf06d89mr551603985a.56.1768982797033;
        Wed, 21 Jan 2026 00:06:37 -0800 (PST)
X-Received: by 2002:a05:620a:2a11:b0:8a9:ef98:6b34 with SMTP id af79cd13be357-8c6ccf06d89mr551601685a.56.1768982796581;
        Wed, 21 Jan 2026 00:06:36 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c14a9sm1203363485a.22.2026.01.21.00.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:06:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 16:06:27 +0800
Subject: [PATCH v4 1/2] media: i2c: imx412: fix sensor power-on timing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx412-v4-1-f6bdf83f116b@oss.qualcomm.com>
References: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
In-Reply-To: <20260121-imx412-v4-0-f6bdf83f116b@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982789; l=838;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=G7YS2wlAM+w/N0JuzYh6GeMVBzn0xVZZwgxnap2Xevc=;
 b=N5XZfhFHGonnriABM6Og1my2Lq8JuxUBtrONQDjdlouaQju4MGfJYSHSohbwuIYGBxg7o0Gu5
 +yn1TZkMdpxA6qdWpZDGUC49BsvZwMlBY3gGoU2Tdeag5/hL+tmggxg
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=OaiVzxTY c=1 sm=1 tr=0 ts=6970890e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s3i6pRDQQ6AsTw0Ks-IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: jjSyS-TSLHrHpfRKbN9p8KLTmp3eo6eg
X-Proofpoint-ORIG-GUID: jjSyS-TSLHrHpfRKbN9p8KLTmp3eo6eg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA2NyBTYWx0ZWRfX/Y18L4yPYYPt
 GdRA6uX3jiq8YH+vtd0vm+rE/rjQ7NbPYBFOc/NeJZeEQlfYvQUvj+6BHXxZUA7fzw26/Twe7xo
 bn9gzCSx+Q9GwrsgB7RdDgaN0JPLiUXN6Dq6X1zyFu4Q7kouGPAfwIw2y1TZ/+8ZwxISmvuIl19
 4GfRmmI1mnfE2zcD0HkGTFznJ65bv5cvMAgBiNLqEGgVwgk/ck/KMXSSR36e3Jnv5kPr4ZUmz5f
 zUPcTBHkM/8dqGmwN0a8nJf32NpkuUburi3z3I0jzBT/cMU/nHeNTj6ws16NQvwlmySQ9e11rJl
 xH3Yx6SoEYQgWw3GjWP9b1xgK14dtWQy9sKUU/oN6us/Bbf9suQ6mgEIS6SDyTXxgO6rNi+o3tl
 wn2sN4TBS7rzGHrNZseKKmrIoC88xt+z3becbW3/tzZmmi4MZ2M+o0HQXfF43/hlhMyraizjMAE
 2vKq7goyrdBwmYCkqFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210067
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-51190-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 198DE53441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Assert the reset GPIO before first power up. This avoids a mismatch where
the first power up (when the reset GPIO defaults deasserted) differs from
subsequent cycles.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/imx412.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index b3826f80354703b17b416dc233854da3f5736e38..5cb55deb125edb218779b076429f9fff93e11a08 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1188,6 +1188,8 @@ static int imx412_probe(struct i2c_client *client)
 
 	mutex_init(&imx412->mutex);
 
+	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
+
 	ret = imx412_power_on(imx412->dev);
 	if (ret) {
 		dev_err(imx412->dev, "failed to power-on the sensor\n");

-- 
2.34.1


