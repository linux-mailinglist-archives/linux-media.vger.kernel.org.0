Return-Path: <linux-media+bounces-53159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEyPMpUXnGkq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AF1736F1
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2706E30515C9
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D76C26F291;
	Mon, 23 Feb 2026 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cws0ECAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oi/jTobe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8803D34E743
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837202; cv=none; b=WVWfSokwtOrmV14rnn1TdgZrG3X0DRLz7E0ZVmJxxchAWFDNe1TFDa2goz7JLD/x2ki5vxWfifiQfLmJquHaaeO/9vvM0Nln4vyDB/BXRg+liftxKgKe6R7dKuTMDqW1CXSRNZ5RFj43K7q/mggdyJWKrkDqnCtmLKdVUmVu2uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837202; c=relaxed/simple;
	bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIneV+kSR3NmAA+f8amsT2I1/O/lNb8LT7aYniWu1uxUjWCd6n3eDgOJxyYF8CsOxhqPjpK1xwqXxky5zNukxrMmMEX83ypv8Ne3hMu8MVl3jvaBJEwWsdYXlsfqLLkN18ydZPfeWeULPT6fgli8zG6+ox1QM6vidv2+9Y19irE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cws0ECAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oi/jTobe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7WD3V721346
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=cws0ECAbBSCqE6iv
	a8QGmcMF0cnSH9ehxsknG6A2aDPtW9cHO2uem4vDvgFFF66/ZsfJ6uAfEyYz8gKJ
	QgUytz7Is8SH+AYe7IDBTZtKQUD0JgXcLmrmE/5dz2mpGDRr5VRvkRo/BTkDLKbB
	yNLoGtFhMEe8Pk1Se6WZRzgZzWmQGRltuRYozmE8npfyDtPHiJziFtQJIbrRKKoF
	ms+KDNJSiEhZxrZsBunwaUbxpI7XhCsOpb1uMaQWCtqZYLpVBeG3pmO5bko5wgvi
	zZI2B9N51LdwSt+hLE1+CBB1nq3YiKOgt/QyKM8c4VkbuzHoCMyf8gLqO/n7HiI6
	kHp35A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc1uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso575171485a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837199; x=1772441999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=Oi/jTobeMunrp8xeszWD/FTCM5Mdy159ThRGMEjrVuiYJ7vPgbv4yzCibJICEYhSst
         Qz1M7cgtQGE4Y9jL1hfbq6HmxkAoXlC1OE1oXgdN1wvroRVRwXWEDM8rOyPYP00paPBx
         tgbM4/Sm+WimqunHkr0/OLfYEdcz/QiSr+e6ms1fOVi0FLzxQod6wjLVDOmamyxLUXn0
         KcpBXdt0JsVUokdjRIiFLx0a8ppO2hpuoF3S9IuNwZ53fG3DttqOCnPWVgMjhmEOT6yH
         DY+5MXUwpLugz4Ra4HTdczusmZ1IhXV6QRK7yn0QfQGMEcYx4sNG6g7GOi1j9MMuG4PE
         mZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837199; x=1772441999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=Hg4roRIrzMt7tS7KMRs6L0HVcsv8JiaeEy9l1QXLsSuuVTzFBNq7xklzJ+HsPeyA5u
         ZLtfEGpyAViK0fXuPKgfV/rNx3h+KDsTaEecABBlpZdrr5iYZFAPKujd3vGqohNM6dua
         00V8S0mNJHwsEI/LXA9aeYs5qrA8A9+pkMZqO+iiFYgyVKAknDR/QZjAUO03LaM2l5v2
         /VLHMxNcUrESqK6H8jFBg+pUYtmYTCDtDcKgpCWtfC9iVOtFI93ohVsR9gu7+M9qiLmr
         xu0q1DKYi5/EfHCVW4DeFZzB8A9GYIF1z/GfFklvDE5YkUinU9+qUuCu/MibflluGVpO
         J8xg==
X-Forwarded-Encrypted: i=1; AJvYcCUiHGvjyDu6BsLcupY+bGtCIS5JohBiwEGVqYvNeWPDsv71XvZCfxAoAxh34aOliW/2F/1Fq8B+xjXDRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaQLW8cjjnaBIutT7PS6xb++gSGPV7rX9E8HxWWiOD8iAkQHHY
	qvaaI+281iPrTRY7b2QzLL8kRuKHVph8+cpM47xeq0gVJBgSoNILDNdRRiH/mJK2OfMqgvSGWpn
	qm4t7Q1YMNQg5ysNWhKUvsgF1FVDf8lrOl/4Mh/RgZ3JKzvJr3TsK0L5TB4TE6nF8eQ==
X-Gm-Gg: AZuq6aKBuiGxg3vcXzlkTR0zFfaLEUKYWoOjdLAWS8AQEVk++0faFTErdFKT2M0RgZ2
	V6IjAGTog2DCbZoQUVBZXR6MUDGU9aybJyIi/z/Gc2hEdOWmxyyqrh7/GzbBMeGPiYo7GOgGIZK
	dTLpdQjg2sBNwA7YoOqLSjFLCCZIOvrhfA7ulJEpxh/7rVekwb29wL6jmiPplHAtJZ+ss0VOhzq
	N2f+4ZXECk6Y2M/3NYGh4K+Tg7fpQof3TWXQzQtzJgR8DV7kfCUGCmYHKDcmfeGZvNgenBwfQbe
	bykjHyEzMhaoxQn99dmr/mDKVkvTlMp4LA+a8LurNMKYwlVpqX8TDDcD9Y7GcK6IRa7ecb6JGXu
	+gTGUujhmUN/Tx0gi+Na0Cr1ramCKc2rz+yORxbD4v29d0bqn4z0z
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970849885a.52.1771837199594;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970846885a.52.1771837199129;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:31 +0100
Subject: [PATCH v2 02/13] i2c: add i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-2-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb9jzjFTJdq3M6FO7EYY2QiwT8GVE9qmSWuz
 3ohkzvQSVmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/QAKCRAFnS7L/zaE
 w8BmEACrMBvc0WtZJaG8d5jaaStBPDhB6rA1XzsrpvPKTzprO3pfbK0+LDvt2i6hcSz6G/sATKM
 4wmqFf/XEdRLWL54Vwi3cecAtJ8tkTh2p8nA6YHe87diSRhjKjFAv216+yDh0QLuwHOYhUjqM08
 f5kZhLL3dJ4hDRd49MZkT6LGkkFA56GIxx/wOQhMg9FsMGQSnm5tJW4wBUy2F4ldoKdRK3r4eF6
 STm5Z0uulFjPHiAlQ7n/ZGdGSFI/mKQe26GVRiSUTzgHepT6OoK69CwEU6WRm6JdvHpE804SJhS
 6ps8EJHVXUT89mV3+Gbyzz7UtIrFymORTZoy4pq0S5Ari/vp1uOMfyqvRJ0n5OO2oDbe0DiofMd
 L8e6e0NWZ1LU0AHDQ5EFb2rh0u5gom9/cz0WAQ9mGcMdru5aLcsCPFXKFd2aVeRHRskvjca97bk
 pCQ22fRInNk9I9PZzhCx2dLcEUE6ogUyuzOB6bVMFnmtHa6dx99uirWBGGqvzgyIbSqsNGwnXic
 GLik9Q5xUP0W1vpKN6XCwLXHgHleEtmYCyp1FnncRrxB6TxXUTsMd2PluQIrapHsp9Ty4zItN9D
 /wRIDRb0bAFp0WUToMEZ5+f+zdAf3iI9Nl8IyXV7G01Gf2FT7qaKyY93dG3gdHrAKTMSNLB400a
 XLWKVbwUcAwCgXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: rJqKqJAkggVkGHFJdefzWWzn-mG-6gdG
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c1710 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rJqKqJAkggVkGHFJdefzWWzn-mG-6gdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX0gSbRvZGfJQB
 CmC5CRKa4Z59/UgohZXkkvZRDSGCrQyDx7RY57qK00E9gfPkLipXszGhpjfWECC1xjXJE+V6FNZ
 UuTxmP8w0+1IE7tUW3iKEiV9yEzzzvCKRnB7ScRjpoI9m9EwsyRFwRpyyEjZIs+hGBGajoAMBfW
 yrDS2SII2swsC80L6v82iyWrhicYFON3aB9dBJBLLlQn6juhzKJl+/GDpl+i/lh4LdViSI3/0H5
 u4FumaKAHFH0AtTaGdkiGvSujo76xmc5kdHqT0X1fEBs9ujjrLUpNAm60ytXYUrJe8E3BbSnHef
 zzRhCsO+NxT6wotJozqv+K9geQGbipXiW+Q7xCCUM+xmsl0yzFr8GvQeFWYWiLWdjgcT6o2mQ4B
 M7hTilWVEkxJKQZbQEusOwg1wI6KVUoioIVxWGCd7L6COK/X0dc4l918tzROEOxS2rg60EUj5TM
 wKD9vueVeyWcNUdY77w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53159-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 210AF1736F1
X-Rspamd-Action: no action

Add a set of i2c-specific printk helpers that wrap their device-level
counterparts and hide the dereferencing of struct device embedded in
struct i2c_adapter. This is done in order to allow moving this struct
device out of struct i2c_adapter into memory managed by i2c core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..2225696c859f617479be4d5c9d304bb32cbf5e9d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,12 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+#define i2c_err(adap, fmt, ...) dev_err(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_warn(adap, fmt, ...) dev_warn(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_notice(adap, fmt, ...) dev_notice(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_info(adap, fmt, ...) dev_info(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3


