Return-Path: <linux-media+bounces-53220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMk8BiCqnGklJwQAu9opvQ
	(envelope-from <linux-media+bounces-53220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:27:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D417C5B9
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 20:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68C7131A22D7
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 19:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3208E376488;
	Mon, 23 Feb 2026 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqFA/fbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTj0se3R"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE4374746
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873898; cv=none; b=CuCGH9EdhEguHurqoXNBBjgbVLasMAplaWiv2eE4IDJyQyIq+KfIvQmpoRx62jKT2mvAyICHpsaKbZ8XwELzqjNs61jPIKvxoa9hc6e1DaeRqq9uP0nap7KarI/rr5/PI3xDjbss5R6Z6zhUeiEnR2lP4s3YIJ55E6ajPYmSNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873898; c=relaxed/simple;
	bh=Lyy5sl15dqp/AXuBfl18EdJ2b3DY11ZJbm74AYUuJlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/gyYFHo54/ylO3iL7UxgE9U267Qf8hOHQ36CYW082FqWm5zK/bSh8eqcE5OvVtCEPQHOBaoTScxbdz7NTEVRSs1coOoRmittJyj/T/qPCVUezVAD70Yctsfc6eqwhy4oKd2E4NoW81MqlbbxI5pmU5khTlgjaw/9gfru27mH9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqFA/fbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTj0se3R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIvCIN3409088
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=; b=pqFA/fbd40J7GH0t
	61FyLOwfDSBvbMB0H48uB5tQBf1nMdwKyi7biOEudmKNLtZaCsHYrrY/RnXrULD4
	w4yAWFNMhi50p0mUeEzxYnRpAxzUsKqBh/pCA3yKoiiWVnVijCCw2Lr6ocNjAwS/
	yo/iHekskfL7+jZGq0dYD6AMhCUsw+aYBjxRqJigwofNqsASS6DqjbDCKDNjGeva
	ZhR57O96hFB0Ppr3UBZXQqFPhusEZciHCQ7Q0HMY+qI2KySKOkAPwz4wCWfSFwRv
	gVh0g8+HS7qHnwJT/iBLrycvZyJHCNIIhltkojxsTRyuAREntcMXPozM3Ft9BD7K
	1QpTdg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8tsk9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 19:11:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so60906665ad.0
        for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 11:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873896; x=1772478696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=;
        b=jTj0se3RNwIyWh3zFk8u3xW4KdT1njeYLwrxLRaIpYtgFAlepUXNvBZuYK4lxogXmC
         12r7ke3O+bY22nZhdkMY5ULNIEQ9eQHxi3cb0jTtzhVP5WEs/uFpOtc5672SiJvtzSjG
         3RVMAi0rqKbN6ite2RDbMuhA4ZiK1icD2xMr0jrjnFuO/d22VTLuHMyPQGk4iu7LfKhv
         8os5zbPjCl9FvSRXu2zeEg0LzIfFHbLWyE8aRwyUDpVl44tfN84QIMDbpFsDooVULyu3
         6Uh9wU97yfnfRBnx2UEYVAwNEZQnh6Us9qK8mhXRKu1KUofh5WTuoE6DM66JRAP/A+l0
         FUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873896; x=1772478696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=;
        b=gkhAWQvWrL4RMB75fZUWuxnWQWnjjqTptFyY2Hf1fn3rTRlNePrDv564DvkccgzLbf
         TQPMiuacGTY/VUAEiRBq3MYb9oM3FA+eABt3EkBgVRIGHNQ/shmXpVU4zQNyKhdJrIzn
         E0MthqXlZPXJmpMJy3iAghszRzA65Czua6hCCVWsvzmvUnvuQo6c9QV5pD40iCxBF9iK
         V7TCidXBcw1Y7hK7OR6049kWK2iFYYxxLHz+lQ4ZPGHtFRgUyIj8DFYoSHDJhhcEFOBn
         Gdp20vWjCPR2p5AoTiY2s5xu6v1luV7QH2iBDNvCr9f4pZ2GOL+LjbWIuhA6Knu/5lUS
         RSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpX7ydHOuaU29LH2Kxpii9iDhtQZn7kkp4ZFWk2sdBICr8FIlOaSUlz1A+5lnjALgOqHtWuyXhqO8auQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyplyTbnCsng69IeltDbUGsPuyA6zTPiQbD+Ls/P3Iwoh80M1t
	LDnT0iajvAx21W4lGYjelNi+UEVVjORDB/B/y73NhtybFMsYgkInKyEe67N3wBoCnNgGKRPZr+i
	yoV9k4VZFjpVHp7wfiikkwrp7k+P1DvvL3iuMpSkzYsiZJ9GkZamKcE0URJYmiHrhWw==
X-Gm-Gg: ATEYQzy+pCoSqssBtWUJtyoRnqOdUcR2I8uEauIdP4vj7Jy4GZkqqhZsf6tSfxBllLy
	h3FFFH2IUG9a+WlFyLlKqSuf87KsHU//dGPhN4r2WObzsMszy4aHMxmdB6DG36Q95L2b6X1q9I5
	7ZSxETzY+AdSOf+6qwqRNp3H+f0JpozKKDolxodvbaPHPHaMrepklkpuvAfRitJ/welrRA8Wh6n
	NCesMTtY+teb9fVvWfUIP4ZyijXlffGTNOYVWLIP2kBB8bzISXGrLClZ0sc7sOZxgIQyl53ePtX
	fa9+u5hhSv1DUM+4DUppNzlRLqDYDBC7+w63dDOUvVKxmIv/K55GhcTln+Od6O/GkB85sr1xWRS
	ruIBqXUvPYf/6GqxWAkOSxAFM5wHyQpeKEhboOoV6HoPCrGF9Z4TJTQ==
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id d9443c01a7336-2ad74525046mr99741345ad.40.1771873895867;
        Mon, 23 Feb 2026 11:11:35 -0800 (PST)
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id d9443c01a7336-2ad74525046mr99740985ad.40.1771873895387;
        Mon, 23 Feb 2026 11:11:35 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:11:34 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:12 +0530
Subject: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=1237;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Lyy5sl15dqp/AXuBfl18EdJ2b3DY11ZJbm74AYUuJlc=;
 b=U2RuZmqfnOzXIV4uEy/q/+tEABjRAyjmepjpnCpXNvRPVQEY3N8FyXUwnOR4IQspDW9EJCN6r
 /BSlCMecuL/A6nXKoi/ZCcCSKbs/ob1ERp+7UwIQROKZVvMOxgaov2G
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699ca668 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=DP9mDQDU2fd_VHYdcv8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: FGUeq96G0j5-xQPEuQrO5871gYlwkz9e
X-Proofpoint-GUID: FGUeq96G0j5-xQPEuQrO5871gYlwkz9e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX9o8MBbPo8AeL
 2bb6oRcwNTB6Jxa2SYdNEuyhkYw9VLQd9X7pvfBB9zgxcn8GA8C2QkTlLvXijsdBWsy5lTWzZGx
 zTnZXIpgFzl79sZ8vCr9gm91qzUojtzOXuoEzyPCmokeoT9kOCG5hd0OBBvrvtVFiJwkp2ZhYYY
 gqCjleOgpS7JEmVL/xxHlXRowGHqXJ5HQrBnuygXgOb7clIBm+khJL6h1WrldPb78Bm5So8ldb7
 dLZIFzWogFhfjmZHzPkpW65TSjbPGwujNwRezcf6U9vTiVqwlYa9bxyw1wBtXezwfVpzSmPyXF0
 4Oa0sRg+4LQND7YdZlHIvJWRJQH/0y5FqbICQtp8BBpsLF41XPaCrwmSXi3BmiwmQ6VF8NrpxoU
 I0wjihXcHIsy5QRj7XJuKjpNdxUEtnYca2bLcFjUSmkHMrTOqNlZeaEAtB3zVzl/6vobUjstcbK
 N6rsE5Z1/MaiiXimveA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53220-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,lists.freedesktop.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 695D417C5B9
X-Rspamd-Action: no action

Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
driver. The entry lists the primary maintainer, the linux-arm-msm and
dri-devel mailing lists, and covers all source files under
drivers/accel/qda, Documentation/accel/qda and the UAPI header
include/uapi/drm/qda_accel.h.

This ensures that patches to the QDA driver and its public API are
tracked and routed to the appropriate reviewers as the driver is
integrated into the DRM accel subsystem.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71f76fddebbf..78b8b82a6370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21691,6 +21691,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1


