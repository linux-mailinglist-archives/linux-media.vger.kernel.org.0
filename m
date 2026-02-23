Return-Path: <linux-media+bounces-53170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCkGGDoYnGmq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:04:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FCA1737B4
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC96F307BAA3
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF3C34F46B;
	Mon, 23 Feb 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hvr7zPTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMGN9gLA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6164634EEED
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837229; cv=none; b=P0Cl3WzxyAxTXFDjw5Xco5dCvHA6DvSKZkz/tk37q+YBNHlSmK53fOhLOONbL/GF1uTmmcJd0yInmpB8P1TWnqYZklL3WJ0lUWRCZhVLO5DxmCJW6mLpBjHsYyD8nxZwH1+Df2B9hVCnZFImqr3abw9ECQfRCY/axmp7a7E1whM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837229; c=relaxed/simple;
	bh=JDZZ/6aGOo6nTpfOU40qBlSpYdHiADcGwoYL6QYt5dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8eKjm3tUDmCCFVRCJbM0hPueMZTGZYIjuqz3S90jIk2MEz8VAIdoFm9O9kS7BUR3cPPrSOji9wKJyE5NWSJ5rl7SXm7HmqDBq13ZIq+EIMwpB9l96FJ3G3vYki05UY8H3JXiJbeFD8d90JwvvI/x5LQuDlZSrgGYygIQ/H6zzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hvr7zPTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMGN9gLA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNMw9P2295461
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=; b=Hvr7zPTzrCaCVx85
	+pWeuCaqk3ssZ3HpkZRf+BLU90H8Q9hwgIsSRvokmoMdvCIv/lykqwqQ1tVUhCyy
	0j9tZZE0BoxwcP+klWXT7MLXWAvCJQISCVuiO9J55chWHyHkCP/XhoZp/t4M4Y/k
	dFXBM4EPtwVa+4toWGGGGue3TaXQw1RivEQLz5Ypek8SioKEBaQVoDNT44NxHmEd
	Gu4ucWk0dWMeK/rCMfday9iyQ3Zup380LIaWK1kP0+m0RkY7MWFx4+0/Mn3+ysrk
	uiFCOmnQS7JElPU6r72eSg8NF6yTiIw10k+5nXvMMcpz7zsX5//azU1OEjB8BvoF
	pHcCbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukyq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb42f56c4aso4404586485a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837227; x=1772442027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
        b=HMGN9gLA/cRhOD2i+cbLGK79jatxq8FZ5k7AvLKOmH7kIhPofW+8fT0md+F1oXKiLa
         qrJUiQxVBMWxckcYiWWmqK+sAtWz7aklVygahiVsDjpnwXUGNfWGVPF/ATZJiPLIFHn+
         fZqGe99HO0YhNSTtgFs+Idam9kxawlLTt3iJgEU0ej+Wn14FFB996MDDi/heHULYhv8R
         ul5Edj5u5HAU/B4CPMkbi25dhFpLrhVZgRvF4C4shxBP4IglKdajE3ed5L6WfdL8BonR
         NKxbrDSKTK674QBnJkiK+CpF0FHQGm8m0/aQ8snJ4B9mo1NfhpNkNvVFHc/1RtHRJqda
         8UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837227; x=1772442027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ebs4592ZeGx4XEtowa9rtUzeO9XIr9Cws6MAkd96cvY=;
        b=T865BKno6QB3g887Odp5+phNfKPOuGB0esQKhLAniZrvf+ini+EqFXAHzr3/GDW/7v
         /Po08cyj0kjsCsXBaSBjwE5Fe/cepXwqX7Yd+LBlx0jQpqoWtRTzcMcXma1NlXHb+y1S
         YoxHXEOOaImLTyn5yhNf7Jc4AhPXgW+q1gQWcwGUpN8NspQp+1L4yItjgH6Fd3I57Rf7
         KaRlsXOznhJb34JXg7OyHHcBXJ8esUMyCUIUGx34Gk9c7v1PIOD2+vPDZR27KybEkQd7
         yJl0fxNIfdgBd9RcDLOy9nv03tbmxeaeU9P4YIMPW4b1cRiN1LMz+aoSA5Iho9CUyPeJ
         un3w==
X-Forwarded-Encrypted: i=1; AJvYcCWGzfqUp4EmPAJK0HJdrPCJia23Y9qdrIOGwsCfFuwIEk/VCYqMnZlzRf5giii530El80yu0Mtyp4N+XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOnuC2Is8+tpf6EJdMLfEUMyCYWnLg3dK4vYor1FVyCqZmXp8
	0rsyDevJYe2ls/8vwHuycWgQFZV+G+w6ZrtxhMvqMhqg9ENN7n1EBL/Hiun44wjgR6rGG2MJZH2
	8Pk5ZNuFmqcZ4OFG+eKGpi7zqVIqY5xPox31W4MJd3elso+acRazARXzlpCZUod2ILg==
X-Gm-Gg: AZuq6aLs83wr+5qi77fDDHE2a7tB9xkR5wmwuLT95PUMsbRIAspbVYp4hb3/H9Sso40
	WseN2m5+NgFAY7UoB1nOmLMVxkACRF8mgl2w8Kcp9lvBJLpkXEMPf6VyaJz9QRnqTdVFD83LtYW
	HynQaRWqpsok59bwfb/naCKxXmVrIoNkPE7YrJJ58wqG5ceZPdgkz59TyLvVzheEohRjM9JbDLq
	6kuM3onKwt/HqDUoiAL/gYIvNhKMUCvn0gbCn005jaGVJd9allgt8SEBHELyGpijScLbpG3uZ2o
	0j1M0wvP/YZt7ImWU61l7pBGw60WbMZygaKcA8uBT5BRxDhlxzLHfF/svZ4vFXXPE8Ss+43CMBS
	8yBmmokPUiIhESQFAno8DAo/lQAVJs32LmA4ESeeZn+V0I9iB6ExY
X-Received: by 2002:a05:620a:318f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8cb8ca8962amr979347385a.72.1771837226487;
        Mon, 23 Feb 2026 01:00:26 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8c6:b258:dff7 with SMTP id af79cd13be357-8cb8ca8962amr979342585a.72.1771837225985;
        Mon, 23 Feb 2026 01:00:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:42 +0100
Subject: [PATCH v2 13/13] i2c: piix4: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-13-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JDZZ/6aGOo6nTpfOU40qBlSpYdHiADcGwoYL6QYt5dk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcIdZYwirJnUNOGujgI7ogwb5RBbVsRgHzZt
 6K9WXX042OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXCAAKCRAFnS7L/zaE
 w/1fD/9C9lHh11MQDFHNS2CdDlMZobYyoli8+SLRr7N1NFuXSbJv/+h//P2hoBy0ke6yXqTJ4+L
 axzRX/jM2FO3L1ru6ZrxkjvExiROejYsY2HigPuosAHZEcMJHX50dppFDbhFtilqHuGGRbQ91rb
 UdnyjHFtSkUZAtT/ahTl9re5M8Vighq8YxQKegyiyrIfT4o5mJMMyI5gs4cv9wWuhpByp+tchBj
 n+NVrFNe4cUBw0EgzHfbabeRPa75XEGBdgCLmD/0BOT4YBwTL4BmfBt/4kazL2DiuU1ogHEDSID
 3K7NJSMh+04p0We0l2P8ZxiEn6EMBMjvh0h8wQqUrPdCEzBCNe/1dVdSthVFXYEppwL4ofSvok6
 XG9a+P6zSiBBE+B1A2+hmabACNJNMQ0AvZY4GXpDWjhOiW7QVl1HIiQEiPCyiyi30W+rVH4lspI
 8JUhkGQuwW9zYF/NzbMusTvzOqoJ0XsNGI3vHJPv0CqVQLX4m1bPZnqaf9OW+ls0gPDcrrK+oeq
 r23BCzSbMK80frsQ8dtiZGTXaAxlemajkek9awA8vE6y3aFEynS4iquHJ2E8pWSbYo4ke7/5C0d
 GD8jLMRaKsY+SoT4O7JObjMnj/9nVkONjeXiLY+x3XdOiJsoVn+/Tx1OvpSG88jXqVllU0NwSqV
 ozIxTLR3zZ0NIZg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c172b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NAIHJU0A_8LueaKkRQqdpnpzntgdKfvL
X-Proofpoint-ORIG-GUID: NAIHJU0A_8LueaKkRQqdpnpzntgdKfvL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX+MfNLB9cQwXW
 8jF/iqm+KDgb7fqYUxrlbaOIHDVAQnjT0V4MY6XesKMJc7iwVGWxClf59zmGpztPCSUyAWUhqad
 u2Ql+KAeZUnKmHO247d8LruMNdTcqf7OSGOqbRHDMDMUiePUSR4/q1E4Tc9coLG1BJ8sdtt+asH
 p++UBPJiiHCfPPk1Qzu749tw2+rXZGbXfBbed6+E1WxCQCRPFEX5TValh1pYxrUky0VT64PlYFc
 MOxnPDl0og4nPI3pRpv5YfHhfbmD9g3QUVZtjw1qmMIv5+5PGh0HVXQqu9S2PFk3/epszHPCHF+
 c00m/IWzlljyt/4Y9CayxlSMp2zi5Kkf9ygZafxJIlWthQAzm2VbyPsObr7yyxqK/p+sl2YsDfV
 9IcBCfUjHE7+z/K6KxaVN9YZg/NaP4fMbgZ307szaAUutsj4vx12LUKBNvBeffkmsZmctQSwUy3
 cEQgRbAkB+SU/d7JlGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53170-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06FCA1737B4
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 7b6a4e201be4a211c3b84e57fb7d8e0adc9895b7..d7fa2fbace908d1c2de66aae152e848bd1678fb9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3


