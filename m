Return-Path: <linux-media+bounces-53166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM7MJKgXnGmq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB67173702
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C2B4304EEB9
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9F34F270;
	Mon, 23 Feb 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0N/woDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkOXvQnI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE2834E779
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837219; cv=none; b=eYM9fMz9CoDnC3maXCcPXCx2CIYqgdjzlI2+F1FeLWNIoFHwprii5uD5IvfbYrhOdC8poyqa/07dVToTc305U8GPpxIJUEREMWqUCk8qLyTLtDKhK3/i+EqnZ15VUyPjrekdOVU04VLPddWCzuGcs2XSjcmZWX8XXtFCJFYy2mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837219; c=relaxed/simple;
	bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfRMGrCX9CuRW59lZaVIkdUe1ckm1yozfcmKNU//XaTne5/asYIpKXyfbBifKboevxGfAJS0A01k8BBOzXu/YE1HvnPQnbKnmUrnW/R4WXVQGGT30ktj4AuUrDBsr6DY0tR0kDbDeohGj2gklIzG9F3yHKPzf/g74WJ+aMY9ogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0N/woDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkOXvQnI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMMtuJ3234263
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=K0N/woDFr29hUgCL
	j4aSDpX99bJZJUbqnsHkF54vWRZ2E3TE6N6BmrLpb6yhd9J0hJkoWckH0PsfsrY9
	wa84yN5dwdoeHPLG3JaETb+M+1cRKKNc2HAgnRNoS1aSpgbKfmFyVfJpUEDtzxeZ
	QgliwKASu4Hi3WzPKyWMAHJ1P0aLlK2oOU1K0CRdb5SLcfZ9/4SADrgHXn0oYnpB
	vighooS7fG02Yyo6y75JFnllJ1bfqvApzfIb6LYnbqn3B9RS9f0p4QR1rE5OUSgx
	xWe8J6lDTWWXzLkQsr79kCH8Ovecmu4vEgTlEQQJag//jTYLyi3ca8cWLLIFxxgE
	tDKP6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk4074-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so3431746185a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837216; x=1772442016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=YkOXvQnIYKppGDAOYA1VDH/Ho0UL7zIQwQUYfViIPuVAhL+VfV5LZ8lRdxOX8eoPYZ
         o6vro6ijF6c8jsCecvuVBWlJEZCrjs8fiy6XzLdTPeyYc+dr/HCGHANR/cAUkROD5emL
         4bzga7pNGyiM4CxjPzqA2t29gX+EjrUDtUdVXIi+LoI72O7tJHZXHFIH2cqm4c6Mc9HF
         4+ahYIfRwj5aM+gu6Ofmyn8CKQSFDmdsTSGrOA57WsCZsHaVnKT8tpSivVj1mOOi2mn/
         G10oNC3HTn5Xzi3Mvu8l3EFdJc0zQ1eSOuS0JfSIX4i3eoFnPctMU57rPGVye0v0Zp/L
         43EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837216; x=1772442016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=I0rq6hjUJgXfGVmGlsGSsjF9ha6F5bdCr8WXH3ba9kPfHr0W/XSUe/bZWpGyx2MJom
         Zj3lnVbyPEk41Gbd1wpEkFMOCdnnfVBdaFx3GXxjbWb7dPKsJqrEgqovP+t0mLRfDpID
         KD509rCj+g5w6y2Cro1um6s4ECiBjvGtag1HiKODlyE+GjPMupsGzxavsLqgGctrce7W
         NXm1zsvDMNlH1C47xF4APmHhWX7r6mN2Y9WQ1UPRc4UB0cjoAS1RIEvn7GHlF0TJOSwQ
         8Mxa/v1UUJHMDrbPvAyH78YIOMnyiW1DIIkbcGD0yZ9UN3MIB6uvwfAPa3tYUFnK8h+w
         Itmw==
X-Forwarded-Encrypted: i=1; AJvYcCWp9b/hBEUdlZqoqupuB9c0uqLnTR0lNuCydFZWjcdM9aOlnSq2HFDJBkP+U77S39SdHJT+3x8LhDTiDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZojmCMkfen0l91xOH89bznQIYzvr9pQ9VOhScKNMsYhjXCX5
	WbY6ShVXAa3FGv+KJhOHBSv+v+r4pwD6IAj8wUK0tvj0GjfSdMxqmv3sopZZPw3O4r4gSuBO4Pm
	K7pTTGJhwKtnPzDdpQgjx2LRxv8R4VHra87+CYkPRn9SBjaRKY1aDR2bocGehxyZS5A==
X-Gm-Gg: AZuq6aLo4pERcpYwNoEVlmKgEJQCgJwv4NeJ1eU9bFoxD/OaY7fGs255WzlzA742CBv
	gNvXr5KhJauas+tXN3Cvd3g4kloAHmI4eMSe+uaJ9HS4WxIrckS+OjNZNma43dRPa2hpT+6AClz
	BBbCq3qmsCIYyzHnYAmIVqqw6XJfE4tlyNZGrKMEKVwwks1GkhsJKLcrWFsQHRDIqumTO1oi7iM
	qjLpOfZKsRRYxQ5/lsD/9m4zl3wZkpGcZ8vo4vZ5d2HKycMyhs9cyGS6H/1Mpbr746LhLjr67/K
	KKcvRon1fyLGn7q+8YEtGTnsJoi1cld3qs5rwBQNeZI6NRH7KNj5xQLt7lzFdw/zg0fhqyijj3Z
	xIPuLzvDDJN8x9814ml4T5Ln+T3kdajUzcUcUs0pvcmkpvXeIXu7F
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951740485a.24.1771837215868;
        Mon, 23 Feb 2026 01:00:15 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8cb:7ad5:6c09 with SMTP id af79cd13be357-8cb8ca0db51mr951731085a.24.1771837214830;
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:38 +0100
Subject: [PATCH v2 09/13] i2c: powermac: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-9-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcFq5rr7pZsKaH0vo50s68t3HBi/s2UeO3pf
 cyse87kAE2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBQAKCRAFnS7L/zaE
 wwvQD/9KQpGaSOnhf7D5wLXAJtnQ/I9Vwv8R/l5Y+cN3CDNCgFgfSuV8c71GsQwvh5rVVtCYtuI
 O0v0A2OBZs0blNA1qvLFtl+B/sCtCoAuWmbmTse+WATvyGDO0kn/cabe2lihk+xZ/oUzJf1LU6v
 JdAjq4Epdp+fHbNELIyQ1jBt9UPC5J2fmIbgHqZcX8lOZvx4Y524oMJ4NcXEkTLAShJtZiFMTC+
 4Lxl0MTG4YjeeoyByjGFZuskzAy7Uuq3TIGwCkFINVGezKvdEVYcWoAwtEPKM1cire1U/HOJ03U
 M3wZxH9U2KmoVtcm1eJvyPAKp83Y3EzpgGVgIdW0fsOV4brc8ppWTQ8PcTTQNEtA9kcyvYWREAx
 9/TFULQeBL+tzYS38s2fciWkKtrXyaTKtHJ1x9uOazhuzE54jUFHZnF/EyZTNqqEyhsDib2K1p+
 UGFV7sUXMI3+ZxPU/l+iURu0zhIxQCSPGzb6L93EZZ+j1SUDTQS0u04wVUcKHejW0rnUPsRMp0i
 aDU2wl8yMkmu/EerybVNislobBDsx4vSVOtRgMxwY7iJU49TA4qZ3vaBAxo8gKOHtrky2CP39AV
 nk3WeuefJSAZPiKC/jAbYqThvGTXNtLxu/a2PkSu0s5P5PwgDE/+RvFp0LiA4L23pNvBnmMhRlq
 V+y4rtaVTGtj7Ng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1721 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXxHawt1RJcFWr
 MxksCz0163DQSXDqYjp6jCmmSGKsIYAKYLjBmIX5bnc2GfcZZfGpP0HWaqMoUmES1TAoXeutvqv
 je2MLAbMbeUO9Cvq/CnzDRuvvasqGyE8eE5zKBTdhd6PupBaMaeQv5kE+nc4IPYDqUpbX2l4RFh
 dvH4lRI12ZpjIiBUcn4RvTCmMEL47YZsvaRUphsI0lFvDXJnqDNhHQDniBPvArSJ5yi34/SmQBM
 6fxGThAiFzc4hNLcWyrTdKgeh07cU76y0dsMQdOEzd5FCC69Z+cCRroVuZ6el21EhIDLDsE4S7c
 QMlKmM7Pt+Xod6YSYYe8OlmJhwnZDXRfOkE1lBF/K21fFQ8HS0KnUuyd+cZfDyrxinzIfSEgGhU
 gO4cIKCQIG+TYMHeAKf4s0+7jMknOL42tgTLQqYgNEu0ZvEOyprtPbEMRnkGnP5kfXk011c4nri
 FhxDyG9N7NewNOs8G+g==
X-Proofpoint-ORIG-GUID: 9xwKiiFOkZSOEdYla1oDce1DkmnApxzy
X-Proofpoint-GUID: 9xwKiiFOkZSOEdYla1oDce1DkmnApxzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-53166-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 0FB67173702
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3


