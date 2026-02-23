Return-Path: <linux-media+bounces-53161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGnWBmwXnGkq/gMAu9opvQ
	(envelope-from <linux-media+bounces-53161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:01:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B861736A0
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 10:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A395A303DF6D
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 09:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E18A34D923;
	Mon, 23 Feb 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqVMtq+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkBTlA5P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A0134EEFB
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837209; cv=none; b=Q8UQg7ZUen1JCiziIn4a5WCH7rZor8sX4AtunMt3XAhqMWKnlzSxDR8H7k1yCGejccq469l6yTABouXn7THy56OaH4DEMdyi3iPW1pQKFEmgZcIlqBy+HWarpO76XWsXXqNQ1Y9OgMePPWuqw1QR21uCiX/6VUZO0dzUAf9kVn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837209; c=relaxed/simple;
	bh=YO+5s1NixQKVQ+sAM+FPc6Fk6P4i9sqW1J3IBeWikPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fRq4vEdJcn615LiVxpEtVkLpLBiGivBEhk+cpS5a23LY4cJIbKxhFqcihjb+djSdr/yvUl8n6CDr1RWgKCgg8b8xdlLtAn5PHLm7XJMZEMKyNKVser8KvOTeZ3GdEyL30ODIEake0cz+20iiQkPnryCgoaHnoe6HV9mg7znitqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqVMtq+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkBTlA5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKPLCA1710276
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=; b=NqVMtq+twfczC/sc
	BwttqQQL5StjbFbLr//QuB0+TOJut7qV/VQB+NBMZkjtTVI4sbR0Il1x+OMAg7mv
	IoJVxVj0pMUHqSURupsBor9GQry7DNDOWmuK03xVzsY7aQ0sQvnoCvOFZGxLE9Yo
	DwZ9crgcdLy50eAkmTPD0YRUKjOhMwEyTfiZHFGAW0iHO3XSTcuTTBwzI9itV3/T
	wtILadGgeCeEKCEBI6PPyq+42q/PcWIhtK6THciR/yg7gxBcKLv0Ti99TNu6lndh
	LDlHEiwWLSYBk4mDdsDcnsffWyTE1LXANwO1zZTUY4978bHcQE8/vcsLsUpx4rk5
	VqG0Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav2c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 09:00:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so4603681685a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837204; x=1772442004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=hkBTlA5P8O1MP4dDc+s2SRxuzLT4hsnwlHJFXHhjW/8bIVqE60ZGcghB2MQWog0CNn
         Oa7867gDFOKo/zIsDn+3Lb0Jw6+DLpSeOnYT4bU9T+GrE/AceDBf8tmBFxSMFIgeLZwK
         W15eZtRvfldJV2xlV90eHy/4XRG2Nvqb4bQV3eALND2ONE/O7GMdvs7EzpX44j0SJlNH
         P48/DC05ppvgBBODGvR1jW33XunlP4H/Cg8E9XjC7GhTiVUdgrm9tmElC9xXSqF71a8E
         bkdgpWHINvuU9z5hJ6yTMbmSatAuU/z5thhiWOMoSR7j++R5WfJsHxm5zh07l7qQH+Ey
         bKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837204; x=1772442004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T2tWxQkR7+OyPEgchhAczL9UMg2ii+knA6PgKAdoffk=;
        b=VmzfYYoMp5D7nfPV5U315HIyHLZFrHlgDX3AYgl+V2pZ0C0dxoKHWjRU25/UTJdnfK
         hIKazLzNeXfSh5M2ohH4b7LgjwHu41kLXN1L4fMCAE3BavIiJ+4phb+2PwcW1y2H60Bb
         2jlQ0qN7DLYASOJPrbjvgcaEQKgzRQmxqFDC1NGCJ76AhnBa1QKCVWWzEHywdilffV/w
         lN6dBU48uTeHxrswNgnUSlOXIONtK5lZE6IAvaPgAbR8n9tlQ3LjYbuPWlpD+mnvFxAo
         o31/CVVccuY3K1Q5vzogVFOS507AhAOttyXz8m8g/fHTJUnekuwaibMQPK327XBjxuhD
         qIMg==
X-Forwarded-Encrypted: i=1; AJvYcCV83tF8wVDob0EIQOEiG67sRpNBqyTc1PG/L2PxkWePvQggXr7FOgLIO3cpYH7Xo+MyM31lZl5EItnCUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAO2GqaPN2cVB4UcF4qzf2MEcdEUefa024c187FP+pa5RAejt
	JM1Da331XLiG5MOsPRRJZBQvmcuFcMDD71XcOMVzjHf+ENzZmhI8a32+1cvNzEowsR/53MiJxGN
	KIE7kCDwhnPKB/wMkYmd4JOhPxH0zpN9UO3XF2CpyZKGgyjQr4wqnzWzpmqvfyEXKuA==
X-Gm-Gg: AZuq6aL5UrnWVIuNk0KPTE4lJRb7SBswDYScoEejbtK8Tz/BBEqwwZXwvPJXN4mKXPE
	JhBhwSCwpY1a9HCeHK+7uvJzDyNqfDbmU8WIKIdz6rWDR4RlQdg2/dThbJn7tQUGAEydl7LB1X9
	DxjdljfcJz1jiMvWx316bK5NVT+9NRKi67lSQXUr1aqBx5ByEjYOBI+zdGrSQLCHXss+tZwxezH
	Jyo7WGubSGhC/c7nSs+zSptDTah+Ec02gTbRI3S4tz0pnnfWVVEKP7cx1mLSMz3byZQDZUFr9VX
	A8YBPayguSEgiFfWNI3PZA9tbgsw/UFbZz766s5bCDYmHSngkeo487EphfjTt/KOMi4OzUbg8NW
	dpNgTSRb1tvoZfW0uMEOZpoyH3Pq7QP3Dr+XRlrAs8WJdtyXpB4If
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884734885a.45.1771837203920;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
X-Received: by 2002:a05:620a:f15:b0:8cb:4b1d:e424 with SMTP id af79cd13be357-8cb8ca721c3mr884729885a.45.1771837203404;
        Mon, 23 Feb 2026 01:00:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:33 +0100
Subject: [PATCH v2 04/13] i2c: mlxbf: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-4-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YO+5s1NixQKVQ+sAM+FPc6Fk6P4i9sqW1J3IBeWikPo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcAnPQSTaMLTTpvB+xaAFz/B8dcwj5+aqUFR
 iA84Gjv9H2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAAAKCRAFnS7L/zaE
 wyVMD/0SnjD8uJViNM3tDR3CtAnfjAe2U4Tf7D9+q0NnRBNoXRo8sg9cFIL6nR6WVpwvicqFXKD
 LBpoXfdHQMtJfC+b9ppqw5+DNYXMG1syx6rrkvpTGw5Dd0DK5EhAafdd9+VmVrktPCBLDLnzWbz
 jVpCHba/RMWLG+wQe+Bal9ZZxunBPXcvJuK/xmpkLd+JbvqHr34az4mxrCpDk7ZKsFIBs3pd+2m
 H+L63R6NlUKQPd8YKdxgzD489rrVNkNagWDEz2DMOXRANIPSlXLYZOQn9iYt3zu9Uo8h4Kg1l2V
 OewXYuZ63w0J08ozkHp55Vlfg/jqmpuBg0oifaxNc3t2zCFx5ykBJ/9f+Pb+aLPjPF671G+48B3
 g4L5GdCTdn1lypk6SK8jVYIwcTZEcvXPY9uYi9lgiA1mOn9w+iljoViNBJRtC6JAO7x//pW8DA8
 +PKSUINSOaw101BElBgFemtbN4N4879wZyEaY+RaXvwloqTnMrDnpmi+rcbTAoUXUbGMYWmkb1k
 8oqCYSA6I+bYfIAguWYtxgGUgqrxTir+Ky4rKJUijbzaf4RZ2Q0JE1/tssdWWLrFNGGHnIbLe1H
 x5Qr2wdSOwBaRH5NI5StZsRBmoGHGlkxiDzz5o/csfoCE54SK1XtUmhVRnLZxDcWdKs+9gEPBqp
 3zY9ucoq7jzm3xw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1715 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KSXH8CamUCXRpb75a7MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX4s/hT9HSVnHj
 sFjUS+n0koRhUpXtKXwVjzP4S8MOG5wVdLtQM1O6MBAnRIOEW7TYgUqkNLNIygDIsXLkihAayLE
 S3WjvL9pdabtMXV9zDMg8P0LsF6iMvpeKN0+ALV45ia9xAfZdks8weyTfwxlPcZzWNLAZLKvrhv
 JqHP7TylQ1/D+1tEuG6j2vlFyPbsUjjxPJ8m4hk/DP1w4/czouCFzMJi3TwdnnbL6YfHxwlpoJZ
 1RZWR1lXvBzNWG3WexiVwMF31E9umlpyPWS5urrZgrSSCLMx5fK+fPktMn6I9LDZzEtjEvheXWH
 VBVedvhAGPDO26Z40qztSUByaQURjiGvQcBsS7lY2537JAu/CZXvvh7QhmaKOBOyiOjFFULCrbl
 4TWLU3UYhAM+dS06OQ498Jpo2qal+YDi2a+XYMsTqtXepkXMI9XeGv/npliVhwNfnc2hl3qtRl1
 kGtxtFm3KYnkqjU/r+A==
X-Proofpoint-ORIG-GUID: Ihu1vTlBP3T4s4gwM585UztJsjp9hfSF
X-Proofpoint-GUID: Ihu1vTlBP3T4s4gwM585UztJsjp9hfSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
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
	TAGGED_FROM(0.00)[bounces-53161-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 88B861736A0
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 6c1cfe9ec8accefaa3f95424393953ff3b869ff6..1dac73002220920ab8f954b29fcc809c6451daa0 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2038,28 +2038,28 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		mlxbf_i2c_smbus_quick_command(&request, read);
-		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		i2c_dbg(adap, "smbus quick, slave 0x%02x\n", addr);
 		break;
 
 	case I2C_SMBUS_BYTE:
 		mlxbf_i2c_smbus_byte_func(&request,
 					  read ? &data->byte : &command, read,
 					  pec);
-		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte, slave 0x%02x.\n",
 			str_read_write(read), addr);
 		break;
 
 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
-		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
-		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
@@ -2067,7 +2067,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
@@ -2075,14 +2075,14 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
 	case I2C_FUNC_SMBUS_PROC_CALL:
 		mlxbf_i2c_smbus_process_call_func(&request, &command,
 						  (u8 *)&data->word, pec);
-		dev_dbg(&adap->dev, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
 			command, addr);
 		break;
 
@@ -2091,13 +2091,12 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
 						      pec);
-		dev_dbg(&adap->dev, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
+		i2c_dbg(adap, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
 			byte_cnt, addr);
 		break;
 
 	default:
-		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
-			size);
+		i2c_dbg(adap, "Unsupported I2C/SMBus command %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


