Return-Path: <linux-media+bounces-48377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD2CACB1D
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 10:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F5FA30A5212
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 09:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB43D32B9B3;
	Mon,  8 Dec 2025 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="XkFRSWq7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4832B98B;
	Mon,  8 Dec 2025 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765186600; cv=none; b=PJkGhwt+jZ3/2fqobvJtcPAf2qzAuEPfoAA2FR5hs/li+24//X9I32wMuCy41C2ZI7c9Ar8vhiD9OaOMPz+P/Ah3s8GyF0Tu0/ndSCVLOc/TkbOnrpIdU95ZpFSFlfuYt6ZT/UwuoD2yy3z91I6s8X3ljeXFx138W0ky00kzW6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765186600; c=relaxed/simple;
	bh=pRDHXPgpdsEZVoNu6zceAf+FuiNHKGRgZl9xJRBdWfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=M9COA390mcnqFdH3/F/0rS9sIi+ngxY8Xz9vcGiF9WDGBlRyjMy09rzz1eBPIdY1iUD6K4OLWE910Lamuo1wWGt2nOCqSstyKgkxAZUJffFmTNYHoTdrq9VKCr/hy+VSUcr+xaejfKYyBRMvbDw7z9Cu3IjcZg1/w5wYHhGVrFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=XkFRSWq7; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B850Tbn2975655;
	Mon, 8 Dec 2025 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=wpFVK3UISYSElB0YPQplDND
	D+w2ntkyKIuex+dcdKdk=; b=XkFRSWq7ISEdT0owV3iIcVh6O6idCG0kQqYoCLZ
	Bk+orgp2cHOIXsks5NUoWIs7vHovml0mapWnx9+/3rdqd7ZM2ehfAUkzdQtUwF1F
	TrfwLMs6BzgCMK8iJAvDHXj4wmdipRGRDmwXwhiHZxMORQABz9jdGE7nDF/1r24P
	Cb282+JfoVUSoXfUlUNqlQ45dFImpb2c5q0GHm9V5/tgo+Utz0sXX9kG6Q730VHM
	7Zj5lAcVTkuWX0mZBwdUXHnuQm+5j5OT5e9C3FJYZHsiXXe2xVCf0xlzUwuVW8Z9
	zKuUZj4fMGRSorEznYuGFx5/6aO2wGyXamz3CEJVb2E4a4Q==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4avdeuh9j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 09:11:35 +0000 (GMT)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.10.180) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 09:11:33 +0000
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 8 Dec 2025 09:11:00 +0000
Subject: [PATCH] drm/imagination: Disallow exporting of PM/FW protected
 objects
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251208-no-export-pm-fw-obj-v1-1-83ab12c61693@imgtec.com>
X-B4-Tracking: v=1; b=H4sIACOWNmkC/x3MTQqAIBBA4avErBtI+yG6SrSwHGuCVDQqkO6et
 PwW7yWIFJgiDEWCQBdHdjZDlAUsm7IrIetskJVshZA9Wof0eBdO9AeaG928o6JFdXWjta4U5NI
 HMvz813F63w/am9gnZQAAAA==
X-Change-ID: 20251128-no-export-pm-fw-obj-aeca634ddd0a
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        "Alessio
 Belle" <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765185093; l=1842;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=pRDHXPgpdsEZVoNu6zceAf+FuiNHKGRgZl9xJRBdWfw=;
 b=YOnbre475voi9oiZiHLXTC1zdIE6xMbV5ZTNMNa5tOZBHV9madHV4FSZgssiHVP+q59YkS713
 YNjLi3LFs5nA5w2mhKYV3HV1bfWX/UiaFwozmBnSARJ7/ybVo+uyh2n
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Authority-Analysis: v=2.4 cv=UvZu9uwB c=1 sm=1 tr=0 ts=69369647 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=D1vns6AIKIwA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8 a=dJ_P6b1NyDTtC6ShgzQA:9
 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: ixADbrjbHhqrhQ9-1lh3lOEklf8Yl6aL
X-Proofpoint-GUID: ixADbrjbHhqrhQ9-1lh3lOEklf8Yl6aL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA3NiBTYWx0ZWRfXxESxm0h3BKcT
 VTocXGUnolFXKF/sdGBqrDGOoU++hzl6lEpv8Y8qKBulmYAwJVPkOIFVXiu+pRfKrLpZL6avkXC
 r0mWnpxTjI9LJU41AlLudbYO3GnglwApeb/IYl8xM+3WvWj0J31m/FifaK0wRPQ8wy0Uf5i99Px
 bBShfC+leTIHacR4gMBvy0uHcLwKavCWoSjx7dOlkqp5wKOJpd28NQNTPxplmTmceCcK4p1VKyX
 2hQvS2dvVVdYwi10ZOf0ACYfqpXyIPWFIxnFDQo82oAAXbOIaFAvDlzQQU4ODghOy3M8Q0gkBW8
 EQ+svuoqJc0RWQWAe3twgioTdClgo5vvDInpIl5SfxanZhV/ir+fQmvpmytv8eeT2xmB1zud6YR
 c5BtLFXGcDEG1iIrwfWlfoFJ2HddTg==

These objects are meant to be used by the GPU firmware or by the PM unit
within the GPU, in which case they may contain physical addresses.

This adds a layer of protection against exposing potentially exploitable
information outside of the driver.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_gem.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index a66cf082af24..c07c9a915190 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -28,6 +28,16 @@ static void pvr_gem_object_free(struct drm_gem_object *obj)
 	drm_gem_shmem_object_free(obj);
 }
 
+static struct dma_buf *pvr_gem_export(struct drm_gem_object *obj, int flags)
+{
+	struct pvr_gem_object *pvr_obj = gem_to_pvr_gem(obj);
+
+	if (pvr_obj->flags & DRM_PVR_BO_PM_FW_PROTECT)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 static int pvr_gem_mmap(struct drm_gem_object *gem_obj, struct vm_area_struct *vma)
 {
 	struct pvr_gem_object *pvr_obj = gem_to_pvr_gem(gem_obj);
@@ -42,6 +52,7 @@ static int pvr_gem_mmap(struct drm_gem_object *gem_obj, struct vm_area_struct *v
 static const struct drm_gem_object_funcs pvr_gem_object_funcs = {
 	.free = pvr_gem_object_free,
 	.print_info = drm_gem_shmem_object_print_info,
+	.export = pvr_gem_export,
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,

---
base-commit: ca2583412306ceda9304a7c4302fd9efbf43e963
change-id: 20251128-no-export-pm-fw-obj-aeca634ddd0a

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>


