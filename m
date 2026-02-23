Return-Path: <linux-media+bounces-53169-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOMBFA0YnGmq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53169-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:04:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8569173789
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 751D2306D8BA
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7CB34DCFF;
	Mon, 23 Feb 2026 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwlSGsPo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UW/AcyLg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B834FF41
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837225; cv=none; b=jDS+4Hd5bBChk0RRwzLqtEognySV2k0xq6k8IIB+xLiJI6EJ0+WBsyajk+uhW2h6NKoxyVlYx3piQf+cypJoXcB8KMQ5K2XZp8eU43SVkmy8WtikTl/wvBTouUzKBTbmyHhg8712Jep03cQHWBFzE9pC/osEyRSu1ajkQ51OaQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837225; c=relaxed/simple;
	bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKykYMUgWXwHO/n9pVHVtwSa5gkEuvCUwmKIbVAHoDivLh4okGu903EDmlgFS4d0m5rX8q5bDvuP94JHsZw96VEDKRuNnOazKOsfsM/5bBkb3JDyc9Qz8c6qTobqfXTWqJKxti1vdC2RWudQaJyFFNhEO2Y+pHDQPk+KIVxEkaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwlSGsPo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UW/AcyLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNGjKt1776702
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=NwlSGsPoajg1cdlN
	7FzImz3K7gmzTZflY85WSUFFFjqKsV0yoyy9AHVsFMHPRdjvX7zEz4bKOz1FdcrY
	aXWZagVZ5ZFd2Z8FuByy3BgQuM3L4E+3cL2iEwk1Or8o4Hl3TBZvuLcAf8Al+GIP
	gbbubkB3pBEdfiIBubRvwcIdXXX+X+sHj1qa6ABgHM8t+GK0EyS9xwNLk9cg+YYw
	cqeSfSWK/1rjya1QyF89zZvbxZdJqxYN4d08FAjDFCkN4X13IOMkNcA0FbpHWbqu
	kmDGlwB+M5mfh4a539DIBSjhclF2NtGHv9PdOFxL+jQiRY0Pogby/kcckwwNoiz2
	6v0j6A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9v2k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89467edcd21so221439416d6.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837222; x=1772442022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=UW/AcyLgiAPgFJ5iOSCqVeRGyq9VGWCfbKe0pU1GJY+QjabtQOa3lZjMHKL8vDrBzT
         r2C3odl6zegzNemOM9Es3brmSR7MrqM6fnGI92oMP4gPV6iVwLBt6wKlB7qlwFpEV/JD
         PgCAwbCd8hWTQJfUZeUAtxgc4T3VNYLyaKD6EM+vn1niKdw0TrIVa3/O91pKk7apI2GC
         vuUSTIA3oC5G8t9nzXqa6B5L2yVj43G4ajAEFi4Aj053KhStmO5M67UNyfS8hO79K05u
         YCwWWMIoJNqhKeuViD8WoWoBWWgVO3L9zGABveanjWA1PymsTm491VCxPcAPNHY5bf7C
         XCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837222; x=1772442022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=crQpON1i/6s0yXnQJ6N2DjbE9VOStbrF+R4KRdml0q7vX9fbYwaKhWEUTXSNOd39LC
         LEdpwpmHI5sSJUdgT7Af/0wO+m4vWugPAh6jvRjqvc+WtfaTeY1imGFHk4v/6dP9kwyC
         N32fTQu1Odv8fnC9IhVgiasXdYiADQ22KecI1kjHYcpzqEY002y0RwP/tY9kM9zms1lW
         i5OOCZ8uSsNiz+uKGxgrTxqX6KI2+p+hDwHAKS+aQoPWd+IY3bKC4pZdec6kgW8Cpbqa
         b875eBcTimYal4QRwjDBiFBX1l8+a7lXBbj7HdKuhUSVyIFCh0NP+SUDpVjeBBJCqXEr
         Bh+g==
X-Forwarded-Encrypted: i=1; AJvYcCXDlQ22/v4rQWaDXgr04fvk6XiJdbwk01HSqOrIcfTuM1TxEYpiTVJwTGFV34ntB/GAuaRE2ltZ5VukHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cWL5HpSfp5cKQPZ7ywYnCPw9m+A/8qYJrAzPveSCKFbYzSxi
	NLV7dOho1aJN7SnN+CCiveMUxvKW2scXmEzPoIsyLxXCvkWmn65GYeVFqBTGk2pvVbPLPmi06Du
	x6Ya20D2imoQDBcYH6kaX9Gs4RrEaObXULVPsqi5S3YQb0pCjSsnU23L5a3r1heZRhw==
X-Gm-Gg: AZuq6aLOFOaFFakemve0/AKStAAAXOkDo/M8Xe5qnGSmSW8eNQZBm/ferk3Nlu0dbh6
	4GKJtFV42cr9m4ZwQ7aDpGM6Tpio2CCl1wNJ+35Y3DybflW4eFwG204mawqdXhGWy22PBM4Irg6
	4lS0q+EUOmaT7eP2PFuY8m6MfnlStiOSzQNnso4zInbxI9YPtWBjbtNhgVlAH1Y4q+XrKxGwTPm
	ZzgNSe876icRANLTqw+DyChPJnm++pKk3Di/d6OAO25HB7vbcg0PJl5VjRjq9oHS4PLy47d8HV8
	IC0h0XDQgelFnJlnUATEmsGTOfHfQk2oDJC0jhFsWGEHBh1tTKZyke1MsLy1702MS7Yj5xEX3Ii
	4ODvnfveEUcjKPhkGfRB4y2gAwWYrm3IvlPUIh2tmG+jSBlFwPM7M
X-Received: by 2002:a05:620a:4555:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cb8ca65ae1mr991091185a.38.1771837222314;
        Mon, 23 Feb 2026 01:00:22 -0800 (PST)
X-Received: by 2002:a05:620a:4555:b0:8c9:fb26:dc6e with SMTP id af79cd13be357-8cb8ca65ae1mr991085485a.38.1771837221857;
        Mon, 23 Feb 2026 01:00:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:41 +0100
Subject: [PATCH v2 12/13] i2c: amd756: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-12-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcHDR72fg/RLmfqEfX9o8DKYkAT9RN+UOU/R
 RWoY8UXtcqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBwAKCRAFnS7L/zaE
 w6GID/96qWc6HzdW5LSb/XKz9++1uSGtny1zn/Y2Dov7vn78E1+wi1vBGY97PMuY3wBXAFWHPkg
 je0bVLHjsDEv+4uqAr3C4T0MelEgMHgYx+EcA/vRYlrZsDTah14vhyIVVBAgU+LH/qnqHJ9vnb/
 R07bjiuhq0RygoZggbvZxDp2/psEw1yfOq2Tv+rSH51jenKvSShvBbfDzpmXNvo1WIKFKuxObtb
 y+L/xfFlfq9tSHkwKnLFytYKBRgerLwkqFANPeuHYpPL9EXoqHjKuvAt1CJqc55EJVNzGZFkFIT
 eYid0jiEyP0q2IDoJDYUbTPpGLIDJcrrC3Tc7J9uLALV7BTKVrJjdR1lZD0FA50vtH/UdMmTlKt
 vHba0Q2n68Kl5mkhjCDGHPg02it0MuFVgFFppU2bT+u1rTNlfSu1dZpebdQ4uCu55REXTij9N8i
 v3EWewd2H6lkniqel+JvZlorsNA+W42Lpxj7xHgKVQnd5Q2nvPKVGmneLlRQfVn9fpQ/WBaxBuo
 aCNzM7qDoUqFEYSbjFfwq4Tz2MUfkkPH6kT6ZQyMiw1U8U719a0prDzVkG1x9m3lkx7W4zcsGF8
 /9P/DxDJVq94qbo2A6aa9ouqHJR7NFgwxXkhLUoE7sqoBb2GDX0+VLb4wUCGtORmHX3GC0ps1yv
 kOomrQu/puIrA4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX2Ni37rhVuOsd
 KytV1un0XYboVibsINJc36RXx2Hc6OVq5ROnHzzU+LZ1kxDddophZBv5Up7PPC+066843tR3N9h
 ArTocUxYtAgufvQhbMHoLz4laailSPuiO9Rau/BZRtO4ZRBEMS/Muw8UEa5mqIWpYGqdbcy/g/H
 tlIkojisFzCCPNNw+KBT2GMOq+JAVHvQOvvvMflIGQWQrV3OZBihJMJ56x49ukcsOSzfXb4ioTN
 Jka0Mie38ktGVzb67MATnGraOc5WsbCcBJMMDfbsEs7ybbyXbLHoj6DAn1KmwJtHTG32Mod62Q9
 fnKeFhD6WMEdiGsMEnbSg73m3ztkDBm/5suhm+UCKxgeZmr0W0tOcksVobOa5+elJLcYGULMVDB
 B3eJDJsDC6ECzoaK4U0KlKpC5Hn8cVEqnDsbQQu4qMqu44YxEOkw/9RbvzFXbGd2MWd+IV/Td2G
 pXoc/rOQpEpGOvGy5ZA==
X-Proofpoint-GUID: _jpGNYciHnTCEGjFdPykLMwe8Mu9LePM
X-Proofpoint-ORIG-GUID: _jpGNYciHnTCEGjFdPykLMwe8Mu9LePM
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c1726 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IUzV_G_aAFXi5cZUTYgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-53169-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: B8569173789
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-amd756.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 3621c02f1cbabd8c5e9d8a4ae1494ada78726b15..629da0b8024b88cc4d51ea5e785147b462a1281c 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -99,14 +99,14 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
+	i2c_dbg(adap, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
 		inw_p(SMB_GLOBAL_ENABLE), inw_p(SMB_HOST_ADDRESS),
 		inb_p(SMB_HOST_DATA));
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
-		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+		i2c_dbg(adap, "SMBus busy (%04x). Waiting...\n", temp);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
@@ -114,7 +114,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 		         (timeout++ < MAX_TIMEOUT));
 		/* If the SMBus is still busy, we give up */
 		if (timeout > MAX_TIMEOUT) {
-			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
+			i2c_dbg(adap, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
 		timeout = 0;
@@ -131,38 +131,38 @@ static int amd756_transaction(struct i2c_adapter *adap)
 
 	/* If the SMBus is still busy, we give up */
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "Completion timeout!\n");
+		i2c_dbg(adap, "Completion timeout!\n");
 		goto abort;
 	}
 
 	if (temp & GS_PRERR_STS) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev, "SMBus Protocol error (no response)!\n");
+		i2c_dbg(adap, "SMBus Protocol error (no response)!\n");
 	}
 
 	if (temp & GS_COL_STS) {
 		result = -EIO;
-		dev_warn(&adap->dev, "SMBus collision!\n");
+		i2c_warn(adap, "SMBus collision!\n");
 	}
 
 	if (temp & GS_TO_STS) {
 		result = -ETIMEDOUT;
-		dev_dbg(&adap->dev, "SMBus protocol timeout!\n");
+		i2c_dbg(adap, "SMBus protocol timeout!\n");
 	}
 
 	if (temp & GS_HCYC_STS)
-		dev_dbg(&adap->dev, "SMBus protocol success!\n");
+		i2c_dbg(adap, "SMBus protocol success!\n");
 
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
 
 #ifdef DEBUG
 	if (((temp = inw_p(SMB_GLOBAL_STATUS)) & GS_CLEAR_STS) != 0x00) {
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Failed reset at end of transaction (%04x)\n", temp);
 	}
 #endif
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (post): GS=%04x, GE=%04x, ADD=%04x, DAT=%04x\n",
 		inw_p(SMB_GLOBAL_STATUS), inw_p(SMB_GLOBAL_ENABLE),
 		inw_p(SMB_HOST_ADDRESS), inb_p(SMB_HOST_DATA));
@@ -170,7 +170,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	return result;
 
  abort:
-	dev_warn(&adap->dev, "Sending abort\n");
+	i2c_warn(adap, "Sending abort\n");
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_ABORT, SMB_GLOBAL_ENABLE);
 	msleep(100);
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
@@ -233,7 +233,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		size = AMD756_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


