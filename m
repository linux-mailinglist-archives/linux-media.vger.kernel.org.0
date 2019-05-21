Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FC424D35
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 12:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbfEUKwU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 06:52:20 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:55116 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfEUKwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 06:52:20 -0400
Received: by mail-vs1-f74.google.com with SMTP id a197so4032812vsd.21
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=G3VBxozLoE65xTXsD4gGIpK6S+2cNIL8360PqnGCzqY=;
        b=Y/rMMkP3O+rK/oMpAvzf39xpdj+NUus/KXsgvlpIh3OKl+QBP3SQdawMFD+v6z6ln9
         ln1lKrJYmHy+GRSSFs+kaw95eagIXjM7ePaggscenLTTrZ7peZ3V0Fl2eJrKoWAamILm
         yfPEjtPHVLGZK+wLRD+FXZCNBz7XRktMZP1Lbvw0BX2QL5nQ3quQUL8exJ78pTy4BhwO
         XlAGAbmgyNX6x3rXTCUEt4poQvTSLIXT88G2NbOIBRefFJvkWHYjrWB+3sAwGJ4mT961
         ns1jHw22WpjnbSgF3mF7QLULIK6a6eGC1V+HtqUnVTBOaxKCEpxVge+DjRQvCjxTXT56
         XiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=G3VBxozLoE65xTXsD4gGIpK6S+2cNIL8360PqnGCzqY=;
        b=V+Q1nG6Yq4/Ly2IttoHPFzIHLiGhzUl+soVN3vqas5ODMksrv7WOGlKcdwfO633oQC
         kPQKa9RPNnnIel3bhWgGZK9JR/LnZXbZCnYmcRmIZ6HVBXt5aurg+hprL99A6Ivvq2N4
         tvx00QE4RYI498lyAFmm7Dpp9jWt7BV+gY6vy6VFYmqBGCTdmy0wXrXW9TRyFjWYJ1XP
         Wq/vDztGFshP9NJNTa+EgcicXLiTkmB/QqrowajjeDHKyRlfDUP7mKEOKGC/PuUIUNe9
         QNHSvCWSDI6eez/o54FouS2KUD3nmL0blRkcE8J1BIme36ndHStHkoF/Va5fJmRAPM06
         pnqA==
X-Gm-Message-State: APjAAAU0vk2OW1PLoMC7mxsnCEG5e2j91Jyy4AZpqh6Ym31DfviRWKbL
        Mlp7ruhq9znHECsHfC2WG7VWEXcpy3/AvpXA4Ypve4GVhxIP2DvOIhmT4wnShIaKpBWt0os3fzQ
        P/zDiiVB4XKd/Gufd4ONOiDhWtQ0qmj7XHIWTp85G9iQqK7oqbVLRJfh/iG8MPB1x47a5
X-Google-Smtp-Source: APXvYqxxkhoCpNbRBPT83W7oQWYio5RzsUcIwRMMIBgdaMLzu9xao0dVpRg5SNBmqlz+bKMRNjoDIEiqViI=
X-Received: by 2002:ab0:59a2:: with SMTP id g31mr325903uad.0.1558435938387;
 Tue, 21 May 2019 03:52:18 -0700 (PDT)
Date:   Tue, 21 May 2019 12:52:01 +0200
Message-Id: <20190521105203.154043-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v7 1/3] media: cec: expose HDMI connector to CEC dev mapping
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        hverkuil@xs4all.nl
Cc:     linux-kernel@vger.kernel.org,
        Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch proposes to expose explicit mapping between HDMI connectors
and /dev/cecX adapters to userland.

New structure with connector info (card number and connector id in case
of DRM connectors) is added to cec_adapter. That connector info is expected
to be provided when an adapter is created.

CEC notifier is extended so that it can be used to communicate the
connector's info to CEC adapters' creators.

New ioctl, exposing connector info to userland, is added to /dev/cec.

Changes since v6:
 - updated remaining cec_allocate_adapter calls
Changes since v5:
 - make the patch apply against the latest changes in the affected code
Changes since v4:
 - small tweaks + added documentation
Changes since v3:
 - cec_get_connter_conn takes connector_info as argument
Changes since v2:
 - cec_s_connector_info removed, the connector info is now passed to
   cec_allocate_adapter
 - updated commit message
Changes since v1:
=C2=A0- removed the unnecessary event,
=C2=A0- extended cec_connctor_info to allow for various types of connectors=
.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 Documentation/media/kapi/cec-core.rst         |   7 +-
 Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
 .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 109 ++++++++++++++++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c  |   3 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |   2 +-
 drivers/gpu/drm/drm_dp_cec.c                  |  22 ++--
 drivers/gpu/drm/i2c/tda9950.c                 |   3 +-
 drivers/gpu/drm/i915/intel_dp.c               |   4 +-
 drivers/gpu/drm/i915/intel_hdmi.c             |   6 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   8 +-
 drivers/media/cec/cec-adap.c                  |  13 +++
 drivers/media/cec/cec-api.c                   |  12 ++
 drivers/media/cec/cec-core.c                  |   8 +-
 drivers/media/cec/cec-notifier.c              |  20 +++-
 drivers/media/cec/cec-pin.c                   |   2 +-
 drivers/media/i2c/adv7511.c                   |   2 +-
 drivers/media/i2c/adv7604.c                   |   2 +-
 drivers/media/i2c/adv7842.c                   |   2 +-
 drivers/media/i2c/tc358743.c                  |   3 +-
 .../media/platform/cros-ec-cec/cros-ec-cec.c  |   7 +-
 drivers/media/platform/meson/ao-cec-g12a.c    |   3 +-
 drivers/media/platform/meson/ao-cec.c         |   6 +-
 drivers/media/platform/s5p-cec/s5p_cec.c      |   6 +-
 drivers/media/platform/seco-cec/seco-cec.c    |   8 +-
 drivers/media/platform/sti/cec/stih-cec.c     |   6 +-
 drivers/media/platform/stm32/stm32-cec.c      |   2 +-
 drivers/media/platform/tegra-cec/tegra_cec.c  |   5 +-
 drivers/media/platform/vivid/vivid-cec.c      |   2 +-
 drivers/media/usb/pulse8-cec/pulse8-cec.c     |   3 +-
 .../media/usb/rainshadow-cec/rainshadow-cec.c |   3 +-
 include/drm/drm_dp_helper.h                   |  14 +--
 include/media/cec-notifier.h                  |  34 ++++--
 include/media/cec.h                           |  16 ++-
 include/uapi/linux/cec.h                      |  24 ++++
 37 files changed, 316 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.r=
st

diff --git a/Documentation/media/kapi/cec-core.rst b/Documentation/media/ka=
pi/cec-core.rst
index 3ce26b7c2b2b6..3678a0a75104e 100644
--- a/Documentation/media/kapi/cec-core.rst
+++ b/Documentation/media/kapi/cec-core.rst
@@ -37,7 +37,8 @@ calling cec_allocate_adapter() and deleted by calling cec=
_delete_adapter():
=20
 .. c:function::
    struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops=
, void *priv,
-   const char *name, u32 caps, u8 available_las);
+                                            const char *name, u32 caps, u8=
 available_las,
+                                            const struct cec_connector_inf=
o *connector_info);
=20
 .. c:function::
    void cec_delete_adapter(struct cec_adapter *adap);
@@ -65,6 +66,10 @@ available_las:
 	the number of simultaneous logical addresses that this
 	adapter can handle. Must be 1 <=3D available_las <=3D CEC_MAX_LOG_ADDRS.
=20
+connector_info:
+        pointer to a struct describing connector this adapter is associate=
d with,
+        can be NULL.
+
 To obtain the priv pointer use this helper function:
=20
 .. c:function::
diff --git a/Documentation/media/uapi/cec/cec-funcs.rst b/Documentation/med=
ia/uapi/cec/cec-funcs.rst
index 620590b168c9e..dc6da9c639a85 100644
--- a/Documentation/media/uapi/cec/cec-funcs.rst
+++ b/Documentation/media/uapi/cec/cec-funcs.rst
@@ -24,6 +24,7 @@ Function Reference
     cec-ioc-adap-g-caps
     cec-ioc-adap-g-log-addrs
     cec-ioc-adap-g-phys-addr
+    cec-ioc-adap-g-conn-info
     cec-ioc-dqevent
     cec-ioc-g-mode
     cec-ioc-receive
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst b/Do=
cumentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
new file mode 100644
index 0000000000000..87f475d7dfed4
--- /dev/null
+++ b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: GPL-2.0
+..
+.. Copyright 2019 Google LLC
+..
+.. This documentation is free software; you can redistribute it and/or
+.. modify it under the terms of the GNU General Public License
+.. version 2 as published by the Free Software Foundation.
+..
+.. This documentation is distributed in the hope that it will be useful,
+.. but WITHOUT ANY WARRANTY; without even the implied warranty of
+.. MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+.. GNU General Public License for more details.
+..
+.. _CEC_ADAP_G_CONNECTOR_INFO:
+
+*******************************
+ioctl CEC_ADAP_G_CONNECTOR_INFO
+*******************************
+
+Name
+=3D=3D=3D=3D
+
+CEC_ADAP_G_CONNECTOR_INFO - Query HDMI connector information
+
+Synopsis
+=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. c:function:: int ioctl( int fd, CEC_ADAP_G_CONNECTOR_INFO, struct cec_c=
onnector_info *argp )
+    :name: CEC_ADAP_G_CONNECTOR_INFO
+
+Arguments
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+``fd``
+    File descriptor returned by :c:func:`open() <cec-open>`.
+
+``argp``
+
+
+Description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Using this ioctl an application can learn which HDMI connector this CEC
+device corresponds to. While calling this ioctl the application should
+provide pointer to a cec_connector_info struct which will be populated
+by the kernel with the info provided by the adapter's driver. Not all
+drivers supply this information.
+
+.. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.6cm}|
+
+.. c:type:: cec_connector_info
+
+.. flat-table:: struct cec_connector_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 1 8
+
+    * - __u32
+      - ``type``
+      - The type of connector this adapter is associated with.
+    * - union
+      - ``(anonymous)``
+      -
+    * -
+      - ``struct cec_drm_connector_info``
+      - drm
+      - :ref:`cec-drm-connector-info`.
+
+
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+
+.. _connector-type:
+
+.. flat-table:: Connector types
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 8
+
+    * .. _`CEC-CONNECTOR-TYPE-NO-CONNECTOR`:
+
+      - ``CEC_CONNECTOR_TYPE_NO_CONNECTOR``
+      - 0
+      - No connector is associated with the adapter/the information is not=
 provided by the driver.
+    * .. _`CEC-CONNECTOR-TYPE-DRM`:
+
+      - ``CEC_CONNECTOR_TYPE_DRM``
+      - 1
+      - Indicates that a DRM connector is associated with this adapter. In=
fo about the
+        connector can be found in :ref:`cec-drm-connector-info`.
+
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+
+.. c:type:: cec_drm_connector_info
+
+.. _cec-drm-connector-info:
+
+.. flat-table:: struct cec_drm_connector_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 8
+
+    * .. _`CEC-DRM-CONNECTOR-TYPE-CARD-NO`:
+
+      - __u32
+      - ``card_no``
+      - DRM card number - the digit from a card's path, e.g. 0 in case of =
/dev/card0.
+    * .. _`CEC-DRM-CONNECTOR-TYPE-CONNECTOR_ID`:
+
+      - __u32
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 6e205ee36ac3b..7f2eb4eb1035b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -394,7 +394,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_di=
splay_manager *dm,
=20
 	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
 	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
-				      aconnector->base.name, dm->adev->dev);
+				      &aconnector->base);
 	aconnector->mst_mgr.cbs =3D &dm_mst_cbs;
 	drm_dp_mst_topology_mgr_init(
 		&aconnector->mst_mgr,
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm=
/bridge/adv7511/adv7511_cec.c
index a20a45c0b353f..6400ad9b85502 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
@@ -310,7 +310,8 @@ int adv7511_cec_init(struct device *dev, struct adv7511=
 *adv7511)
 		goto err_cec_parse_dt;
=20
 	adv7511->cec_adap =3D cec_allocate_adapter(&adv7511_cec_adap_ops,
-		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS);
+		adv7511, dev_name(dev), CEC_CAP_DEFAULTS, ADV7511_MAX_ADDRS,
+		NULL);
 	if (IS_ERR(adv7511->cec_adap)) {
 		ret =3D PTR_ERR(adv7511->cec_adap);
 		goto err_cec_alloc;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/dr=
m/bridge/synopsys/dw-hdmi-cec.c
index 6c323510f1288..84fb7b6a0a5e0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -261,7 +261,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pd=
ev)
 	cec->adap =3D cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
 					 CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
 					 CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
-					 CEC_MAX_LOG_ADDRS);
+					 CEC_MAX_LOG_ADDRS, NULL);
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);
=20
diff --git a/drivers/gpu/drm/drm_dp_cec.c b/drivers/gpu/drm/drm_dp_cec.c
index b15cee85b702b..c739acad45475 100644
--- a/drivers/gpu/drm/drm_dp_cec.c
+++ b/drivers/gpu/drm/drm_dp_cec.c
@@ -8,7 +8,9 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <drm/drm_connector.h>
 #include <drm/drm_dp_helper.h>
+#include <drm/drmP.h>
 #include <media/cec.h>
=20
 /*
@@ -295,7 +297,9 @@ static void drm_dp_cec_unregister_work(struct work_stru=
ct *work)
  */
 void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid)
 {
+	struct drm_connector *connector =3D aux->cec.connector;
 	u32 cec_caps =3D CEC_CAP_DEFAULTS | CEC_CAP_NEEDS_HPD;
+	struct cec_connector_info conn_info;
 	unsigned int num_las =3D 1;
 	u8 cap;
=20
@@ -342,15 +346,17 @@ void drm_dp_cec_set_edid(struct drm_dp_aux *aux, cons=
t struct edid *edid)
 		cec_unregister_adapter(aux->cec.adap);
 	}
=20
+	cec_fill_connector_info(&conn_info, connector);
+
 	/* Create a new adapter */
 	aux->cec.adap =3D cec_allocate_adapter(&drm_dp_cec_adap_ops,
-					     aux, aux->cec.name, cec_caps,
-					     num_las);
+					     aux, connector->name, cec_caps,
+					     num_las, &conn_info);
 	if (IS_ERR(aux->cec.adap)) {
 		aux->cec.adap =3D NULL;
 		goto unlock;
 	}
-	if (cec_register_adapter(aux->cec.adap, aux->cec.parent)) {
+	if (cec_register_adapter(aux->cec.adap, connector->dev->dev)) {
 		cec_delete_adapter(aux->cec.adap);
 		aux->cec.adap =3D NULL;
 	} else {
@@ -406,22 +412,20 @@ EXPORT_SYMBOL(drm_dp_cec_unset_edid);
 /**
  * drm_dp_cec_register_connector() - register a new connector
  * @aux: DisplayPort AUX channel
- * @name: name of the CEC device
- * @parent: parent device
+ * @connector: drm connector
  *
  * A new connector was registered with associated CEC adapter name and
  * CEC adapter parent device. After registering the name and parent
  * drm_dp_cec_set_edid() is called to check if the connector supports
  * CEC and to register a CEC adapter if that is the case.
  */
-void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *nam=
e,
-				   struct device *parent)
+void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
+				   struct drm_connector *connector)
 {
 	WARN_ON(aux->cec.adap);
 	if (WARN_ON(!aux->transfer))
 		return;
-	aux->cec.name =3D name;
-	aux->cec.parent =3D parent;
+	aux->cec.connector =3D connector;
 	INIT_DELAYED_WORK(&aux->cec.unregister_work,
 			  drm_dp_cec_unregister_work);
 }
diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 250b5e02a314a..b944dd9df85e1 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -424,7 +424,8 @@ static int tda9950_probe(struct i2c_client *client,
=20
 	priv->adap =3D cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
 					  CEC_CAP_DEFAULTS,
-					  CEC_MAX_LOG_ADDRS);
+					  CEC_MAX_LOG_ADDRS,
+					  NULL);
 	if (IS_ERR(priv->adap))
 		return PTR_ERR(priv->adap);
=20
diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_d=
p.c
index 560274d1c50b2..1dfd16848e033 100644
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@ -5518,7 +5518,6 @@ static int
 intel_dp_connector_register(struct drm_connector *connector)
 {
 	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
-	struct drm_device *dev =3D connector->dev;
 	int ret;
=20
 	ret =3D intel_connector_register(connector);
@@ -5533,8 +5532,7 @@ intel_dp_connector_register(struct drm_connector *con=
nector)
 	intel_dp->aux.dev =3D connector->kdev;
 	ret =3D drm_dp_aux_register(&intel_dp->aux);
 	if (!ret)
-		drm_dp_cec_register_connector(&intel_dp->aux,
-					      connector->name, dev->dev);
+		drm_dp_cec_register_connector(&intel_dp->aux, connector);
 	return ret;
 }
=20
diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel=
_hdmi.c
index 34be2cfd0ec8d..84b30ff91ebd5 100644
--- a/drivers/gpu/drm/i915/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/intel_hdmi.c
@@ -2968,6 +2968,7 @@ void intel_hdmi_init_connector(struct intel_digital_p=
ort *intel_dig_port,
 	struct drm_device *dev =3D intel_encoder->base.dev;
 	struct drm_i915_private *dev_priv =3D to_i915(dev);
 	enum port port =3D intel_encoder->port;
+	struct cec_connector_info conn_info;
=20
 	DRM_DEBUG_KMS("Adding HDMI connector on port %c\n",
 		      port_name(port));
@@ -3020,8 +3021,11 @@ void intel_hdmi_init_connector(struct intel_digital_=
port *intel_dig_port,
 		I915_WRITE(PEG_BAND_GAP_DATA, (temp & ~0xf) | 0xd);
 	}
=20
+	cec_fill_connector_info(&conn_info, connector);
+
 	intel_hdmi->cec_notifier =3D cec_notifier_get_conn(dev->dev,
-							 port_identifier(port));
+							 port_identifier(port),
+							 &conn_info);
 	if (!intel_hdmi->cec_notifier)
 		DRM_DEBUG_KMS("CEC notifier get failed\n");
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/=
nouveau/nouveau_connector.c
index 4116ee62adafe..4438824ca88b0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1413,8 +1413,7 @@ nouveau_connector_create(struct drm_device *dev,
 	switch (type) {
 	case DRM_MODE_CONNECTOR_DisplayPort:
 	case DRM_MODE_CONNECTOR_eDP:
-		drm_dp_cec_register_connector(&nv_connector->aux,
-					      connector->name, dev->dev);
+		drm_dp_cec_register_connector(&nv_connector->aux, connector);
 		break;
 	}
=20
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omap=
drm/dss/hdmi4_cec.c
index ebf9c96d43eee..9d3839f8cc9ca 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -342,7 +342,7 @@ int hdmi4_cec_init(struct platform_device *pdev, struct=
 hdmi_core_data *core,
 	int ret;
=20
 	core->adap =3D cec_allocate_adapter(&hdmi_cec_adap_ops, core,
-		"omap4", caps, CEC_MAX_LOG_ADDRS);
+		"omap4", caps, CEC_MAX_LOG_ADDRS, NULL);
 	ret =3D PTR_ERR_OR_ZERO(core->adap);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.=
c
index 99fc8569e0f52..0e081ee5b9bf9 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1279,6 +1279,9 @@ static const struct cec_adap_ops vc4_hdmi_cec_adap_op=
s =3D {
=20
 static int vc4_hdmi_bind(struct device *dev, struct device *master, void *=
data)
 {
+#ifdef CONFIG_DRM_VC4_HDMI_CEC
+	struct cec_connector_info conn_info;
+#endif
 	struct platform_device *pdev =3D to_platform_device(dev);
 	struct drm_device *drm =3D dev_get_drvdata(master);
 	struct vc4_dev *vc4 =3D drm->dev_private;
@@ -1395,12 +1398,15 @@ static int vc4_hdmi_bind(struct device *dev, struct=
 device *master, void *data)
 		goto err_destroy_encoder;
 	}
 #ifdef CONFIG_DRM_VC4_HDMI_CEC
+	cec_fill_connector_info(&conn_info, hdmi->connector);
+
 	hdmi->cec_adap =3D cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 					      vc4, "vc4",
 					      CEC_CAP_TRANSMIT |
 					      CEC_CAP_LOG_ADDRS |
 					      CEC_CAP_PASSTHROUGH |
-					      CEC_CAP_RC, 1);
+					      CEC_CAP_RC, 1,
+					      &conn_info);
 	ret =3D PTR_ERR_OR_ZERO(hdmi->cec_adap);
 	if (ret < 0)
 		goto err_destroy_conn;
diff --git a/drivers/media/cec/cec-adap.c b/drivers/media/cec/cec-adap.c
index f1261cc2b6fa5..1d2c78bbf3687 100644
--- a/drivers/media/cec/cec-adap.c
+++ b/drivers/media/cec/cec-adap.c
@@ -16,7 +16,10 @@
 #include <linux/string.h>
 #include <linux/types.h>
=20
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_file.h>
=20
 #include "cec-priv.h"
=20
@@ -75,6 +78,16 @@ u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int =
size,
 }
 EXPORT_SYMBOL_GPL(cec_get_edid_phys_addr);
=20
+void cec_fill_connector_info(struct cec_connector_info *conn_info,
+			     const struct drm_connector *connector)
+{
+	memset(conn_info, 0, sizeof(*conn_info));
+	conn_info->type =3D CEC_CONNECTOR_TYPE_DRM;
+	conn_info->drm.card_no =3D connector->dev->primary->index;
+	conn_info->drm.connector_id =3D connector->base.id;
+}
+EXPORT_SYMBOL_GPL(cec_fill_connector_info);
+
 /*
  * Queue a new event for this filehandle. If ts =3D=3D 0, then set it
  * to the current time.
diff --git a/drivers/media/cec/cec-api.c b/drivers/media/cec/cec-api.c
index 156a0d76ab2a1..2ed312ad34a39 100644
--- a/drivers/media/cec/cec-api.c
+++ b/drivers/media/cec/cec-api.c
@@ -187,6 +187,15 @@ static long cec_adap_s_log_addrs(struct cec_adapter *a=
dap, struct cec_fh *fh,
 	return 0;
 }
=20
+static long cec_adap_g_connector_info(struct cec_adapter *adap,
+				      struct cec_log_addrs __user *parg)
+{
+	if (copy_to_user(parg, &adap->connector_info,
+			 sizeof(adap->connector_info)))
+		return -EFAULT;
+	return 0;
+}
+
 static long cec_transmit(struct cec_adapter *adap, struct cec_fh *fh,
 			 bool block, struct cec_msg __user *parg)
 {
@@ -514,6 +523,9 @@ static long cec_ioctl(struct file *filp, unsigned int c=
md, unsigned long arg)
 	case CEC_ADAP_S_LOG_ADDRS:
 		return cec_adap_s_log_addrs(adap, fh, block, parg);
=20
+	case CEC_ADAP_G_CONNECTOR_INFO:
+		return cec_adap_g_connector_info(adap, parg);
+
 	case CEC_TRANSMIT:
 		return cec_transmit(adap, fh, block, parg);
=20
diff --git a/drivers/media/cec/cec-core.c b/drivers/media/cec/cec-core.c
index f5d1578e256a7..7cba00981e841 100644
--- a/drivers/media/cec/cec-core.c
+++ b/drivers/media/cec/cec-core.c
@@ -250,8 +250,9 @@ static const struct file_operations cec_error_inj_fops =
=3D {
 #endif
=20
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
-					 void *priv, const char *name, u32 caps,
-					 u8 available_las)
+			void *priv, const char *name, u32 caps,
+			u8 available_las,
+			const struct cec_connector_info *connector_info)
 {
 	struct cec_adapter *adap;
 	int res;
@@ -288,6 +289,9 @@ struct cec_adapter *cec_allocate_adapter(const struct c=
ec_adap_ops *ops,
 	INIT_LIST_HEAD(&adap->wait_queue);
 	init_waitqueue_head(&adap->kthread_waitq);
=20
+	if (connector_info)
+		adap->connector_info =3D *connector_info;
+
 	/* adap->devnode initialization */
 	INIT_LIST_HEAD(&adap->devnode.fhs);
 	mutex_init(&adap->devnode.lock);
diff --git a/drivers/media/cec/cec-notifier.c b/drivers/media/cec/cec-notif=
ier.c
index 9598c7778871a..36820d0d71677 100644
--- a/drivers/media/cec/cec-notifier.c
+++ b/drivers/media/cec/cec-notifier.c
@@ -27,12 +27,16 @@ struct cec_notifier {
 	void (*callback)(struct cec_adapter *adap, u16 pa);
=20
 	u16 phys_addr;
+	struct cec_connector_info connector_info;
 };
=20
 static LIST_HEAD(cec_notifiers);
 static DEFINE_MUTEX(cec_notifiers_lock);
=20
-struct cec_notifier *cec_notifier_get_conn(struct device *dev, const char =
*conn)
+struct cec_notifier *
+cec_notifier_get_conn(struct device *dev,
+		      const char *conn,
+		      const struct cec_connector_info *connector_info)
 {
 	struct cec_notifier *n;
=20
@@ -52,6 +56,10 @@ struct cec_notifier *cec_notifier_get_conn(struct device=
 *dev, const char *conn)
 	if (conn)
 		n->conn =3D kstrdup(conn, GFP_KERNEL);
 	n->phys_addr =3D CEC_PHYS_ADDR_INVALID;
+
+	if (connector_info)
+		n->connector_info =3D *connector_info;
+
 	mutex_init(&n->lock);
 	kref_init(&n->kref);
 	list_add_tail(&n->head, &cec_notifiers);
@@ -107,9 +115,17 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_n=
otifier *n,
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr_from_edid);
=20
+const struct cec_connector_info *cec_notifier_get_conn_info(
+	struct cec_notifier *n)
+{
+	return &n->connector_info;
+}
+EXPORT_SYMBOL_GPL(cec_notifier_get_conn_info);
+
 void cec_notifier_register(struct cec_notifier *n,
 			   struct cec_adapter *adap,
-			   void (*callback)(struct cec_adapter *adap, u16 pa))
+			   void (*callback)(struct cec_adapter *adap,
+					    u16 pa))
 {
 	kref_get(&n->kref);
 	mutex_lock(&n->lock);
diff --git a/drivers/media/cec/cec-pin.c b/drivers/media/cec/cec-pin.c
index 8f987bc0dd883..1a04a9be737a9 100644
--- a/drivers/media/cec/cec-pin.c
+++ b/drivers/media/cec/cec-pin.c
@@ -1320,7 +1320,7 @@ struct cec_adapter *cec_pin_allocate_adapter(const st=
ruct cec_pin_ops *pin_ops,
=20
 	adap =3D cec_allocate_adapter(&cec_pin_adap_ops, priv, name,
 			    caps | CEC_CAP_MONITOR_ALL | CEC_CAP_MONITOR_PIN,
-			    CEC_MAX_LOG_ADDRS);
+			    CEC_MAX_LOG_ADDRS, NULL);
=20
 	if (IS_ERR(adap)) {
 		kfree(pin);
diff --git a/drivers/media/i2c/adv7511.c b/drivers/media/i2c/adv7511.c
index cec5ebb1c9e60..a785a120e5356 100644
--- a/drivers/media/i2c/adv7511.c
+++ b/drivers/media/i2c/adv7511.c
@@ -1917,7 +1917,7 @@ static int adv7511_probe(struct i2c_client *client, c=
onst struct i2c_device_id *
 #if IS_ENABLED(CONFIG_VIDEO_ADV7511_CEC)
 	state->cec_adap =3D cec_allocate_adapter(&adv7511_cec_adap_ops,
 		state, dev_name(&client->dev), CEC_CAP_DEFAULTS,
-		ADV7511_MAX_ADDRS);
+		ADV7511_MAX_ADDRS, NULL);
 	err =3D PTR_ERR_OR_ZERO(state->cec_adap);
 	if (err) {
 		destroy_workqueue(state->work_queue);
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 28a84bf9f8a94..0a3649f593a7d 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3564,7 +3564,7 @@ static int adv76xx_probe(struct i2c_client *client,
 #if IS_ENABLED(CONFIG_VIDEO_ADV7604_CEC)
 	state->cec_adap =3D cec_allocate_adapter(&adv76xx_cec_adap_ops,
 		state, dev_name(&client->dev),
-		CEC_CAP_DEFAULTS, ADV76XX_MAX_ADDRS);
+		CEC_CAP_DEFAULTS, ADV76XX_MAX_ADDRS, NULL);
 	err =3D PTR_ERR_OR_ZERO(state->cec_adap);
 	if (err)
 		goto err_entity;
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 11ab2df02dc70..ff78a31316bbf 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3565,7 +3565,7 @@ static int adv7842_probe(struct i2c_client *client,
 #if IS_ENABLED(CONFIG_VIDEO_ADV7842_CEC)
 	state->cec_adap =3D cec_allocate_adapter(&adv7842_cec_adap_ops,
 		state, dev_name(&client->dev),
-		CEC_CAP_DEFAULTS, ADV7842_MAX_ADDRS);
+		CEC_CAP_DEFAULTS, ADV7842_MAX_ADDRS, NULL);
 	err =3D PTR_ERR_OR_ZERO(state->cec_adap);
 	if (err)
 		goto err_entity;
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index bc2e35e5ce615..14a686c80a9e6 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2117,7 +2117,8 @@ static int tc358743_probe(struct i2c_client *client,
 #ifdef CONFIG_VIDEO_TC358743_CEC
 	state->cec_adap =3D cec_allocate_adapter(&tc358743_cec_adap_ops,
 		state, dev_name(&client->dev),
-		CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL, CEC_MAX_LOG_ADDRS);
+		CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL, CEC_MAX_LOG_ADDRS,
+		NULL);
 	if (IS_ERR(state->cec_adap)) {
 		err =3D PTR_ERR(state->cec_adap);
 		goto err_hdl;
diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/med=
ia/platform/cros-ec-cec/cros-ec-cec.c
index 068df9888dbf0..f7e7a9e5f8f74 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -235,7 +235,7 @@ static int cros_ec_cec_get_notifier(struct device *dev,
 			if (!d)
 				return -EPROBE_DEFER;
=20
-			*notify =3D cec_notifier_get_conn(d, m->conn);
+			*notify =3D cec_notifier_get_conn(d, m->conn, NULL);
 			put_device(d);
 			return 0;
 		}
@@ -261,6 +261,7 @@ static int cros_ec_cec_probe(struct platform_device *pd=
ev)
 {
 	struct cros_ec_dev *ec_dev =3D dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec =3D ec_dev->ec_dev;
+	const struct cec_connector_info *conn_info;
 	struct cros_ec_cec *cros_ec_cec;
 	int ret;
=20
@@ -282,8 +283,10 @@ static int cros_ec_cec_probe(struct platform_device *p=
dev)
 		return ret;
 	}
=20
+	conn_info =3D cec_notifier_get_conn_info(cros_ec_cec->notify);
+
 	cros_ec_cec->adap =3D cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
-						 DRV_NAME, CEC_CAP_DEFAULTS, 1);
+				DRV_NAME, CEC_CAP_DEFAULTS, 1, conn_info);
 	if (IS_ERR(cros_ec_cec->adap))
 		return PTR_ERR(cros_ec_cec->adap);
=20
diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/pla=
tform/meson/ao-cec-g12a.c
index 3620a1e310f52..e4c45d7d0abd2 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -657,7 +657,8 @@ static int meson_ao_cec_g12a_probe(struct platform_devi=
ce *pdev)
 	ao_cec->adap =3D cec_allocate_adapter(&meson_ao_cec_g12a_ops, ao_cec,
 					    "meson_g12a_ao_cec",
 					    CEC_CAP_DEFAULTS,
-					    CEC_MAX_LOG_ADDRS);
+					    CEC_MAX_LOG_ADDRS,
+					    NULL);
 	if (IS_ERR(ao_cec->adap)) {
 		ret =3D PTR_ERR(ao_cec->adap);
 		goto out_probe_notify;
diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platform=
/meson/ao-cec.c
index facf9b029e797..c219925a7c5c7 100644
--- a/drivers/media/platform/meson/ao-cec.c
+++ b/drivers/media/platform/meson/ao-cec.c
@@ -600,6 +600,7 @@ static const struct cec_adap_ops meson_ao_cec_ops =3D {
=20
 static int meson_ao_cec_probe(struct platform_device *pdev)
 {
+	const struct cec_connector_info *conn_info;
 	struct meson_ao_cec_device *ao_cec;
 	struct device *hdmi_dev;
 	struct resource *res;
@@ -620,13 +621,16 @@ static int meson_ao_cec_probe(struct platform_device =
*pdev)
 	if (!ao_cec->notify)
 		return -ENOMEM;
=20
+	conn_info =3D cec_notifier_get_conn_info(ao_cec->notify);
+
 	ao_cec->adap =3D cec_allocate_adapter(&meson_ao_cec_ops, ao_cec,
 					    "meson_ao_cec",
 					    CEC_CAP_LOG_ADDRS |
 					    CEC_CAP_TRANSMIT |
 					    CEC_CAP_RC |
 					    CEC_CAP_PASSTHROUGH,
-					    1); /* Use 1 for now */
+					    1, /* Use 1 for now */
+					    conn_info);
 	if (IS_ERR(ao_cec->adap)) {
 		ret =3D PTR_ERR(ao_cec->adap);
 		goto out_probe_notify;
diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platf=
orm/s5p-cec/s5p_cec.c
index 7f62f5ef00863..6236f9f7111f0 100644
--- a/drivers/media/platform/s5p-cec/s5p_cec.c
+++ b/drivers/media/platform/s5p-cec/s5p_cec.c
@@ -177,6 +177,7 @@ static const struct cec_adap_ops s5p_cec_adap_ops =3D {
=20
 static int s5p_cec_probe(struct platform_device *pdev)
 {
+	const struct cec_connector_info *conn_info;
 	struct device *dev =3D &pdev->dev;
 	struct device *hdmi_dev;
 	struct resource *res;
@@ -222,8 +223,11 @@ static int s5p_cec_probe(struct platform_device *pdev)
 	if (cec->notifier =3D=3D NULL)
 		return -ENOMEM;
=20
+	conn_info =3D cec_notifier_get_conn_info(cec->notifier);
+
 	cec->adap =3D cec_allocate_adapter(&s5p_cec_adap_ops, cec, CEC_NAME,
-		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1);
+		CEC_CAP_DEFAULTS | (needs_hpd ? CEC_CAP_NEEDS_HPD : 0), 1,
+		conn_info);
 	ret =3D PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/pla=
tform/seco-cec/seco-cec.c
index e5080d6f5b2d3..f74b9f059d21a 100644
--- a/drivers/media/platform/seco-cec/seco-cec.c
+++ b/drivers/media/platform/seco-cec/seco-cec.c
@@ -535,7 +535,7 @@ static int secocec_cec_get_notifier(struct cec_notifier=
 **notify)
 			if (!d)
 				return -EPROBE_DEFER;
=20
-			*notify =3D cec_notifier_get_conn(d, m->conn);
+			*notify =3D cec_notifier_get_conn(d, m->conn, NULL);
 			put_device(d);
=20
 			return 0;
@@ -571,6 +571,7 @@ static int secocec_acpi_probe(struct secocec_data *sdev=
)
=20
 static int secocec_probe(struct platform_device *pdev)
 {
+	const struct cec_connector_info *conn_info;
 	struct secocec_data *secocec;
 	struct device *dev =3D &pdev->dev;
 	int ret;
@@ -636,12 +637,15 @@ static int secocec_probe(struct platform_device *pdev=
)
 		goto err;
 	}
=20
+	conn_info =3D cec_notifier_get_conn_info(secocec->notifier);
+
 	/* Allocate CEC adapter */
 	secocec->cec_adap =3D cec_allocate_adapter(&secocec_cec_adap_ops,
 						 secocec,
 						 dev_name(dev),
 						 CEC_CAP_DEFAULTS,
-						 SECOCEC_MAX_ADDRS);
+						 SECOCEC_MAX_ADDRS,
+						 conn_info);
=20
 	if (IS_ERR(secocec->cec_adap)) {
 		ret =3D PTR_ERR(secocec->cec_adap);
diff --git a/drivers/media/platform/sti/cec/stih-cec.c b/drivers/media/plat=
form/sti/cec/stih-cec.c
index fc37efe1d5542..0b8fbc99a7ea9 100644
--- a/drivers/media/platform/sti/cec/stih-cec.c
+++ b/drivers/media/platform/sti/cec/stih-cec.c
@@ -298,6 +298,7 @@ static const struct cec_adap_ops sti_cec_adap_ops =3D {
=20
 static int stih_cec_probe(struct platform_device *pdev)
 {
+	const struct cec_connector_info *conn_info;
 	struct device *dev =3D &pdev->dev;
 	struct resource *res;
 	struct stih_cec *cec;
@@ -340,8 +341,11 @@ static int stih_cec_probe(struct platform_device *pdev=
)
 		return PTR_ERR(cec->clk);
 	}
=20
+	conn_info =3D cec_notifier_get_conn_info(cec->notifier);
+
 	cec->adap =3D cec_allocate_adapter(&sti_cec_adap_ops, cec,
-			CEC_NAME, CEC_CAP_DEFAULTS, CEC_MAX_LOG_ADDRS);
+			CEC_NAME, CEC_CAP_DEFAULTS, CEC_MAX_LOG_ADDRS,
+			conn_info);
 	ret =3D PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/stm32/stm32-cec.c b/drivers/media/platf=
orm/stm32/stm32-cec.c
index 8a86b2cc22fab..632bda0504983 100644
--- a/drivers/media/platform/stm32/stm32-cec.c
+++ b/drivers/media/platform/stm32/stm32-cec.c
@@ -315,7 +315,7 @@ static int stm32_cec_probe(struct platform_device *pdev=
)
 	 * available for example when a drm driver can provide edid
 	 */
 	cec->adap =3D cec_allocate_adapter(&stm32_cec_adap_ops, cec,
-			CEC_NAME, caps,	CEC_MAX_LOG_ADDRS);
+			CEC_NAME, caps,	CEC_MAX_LOG_ADDRS, NULL);
 	ret =3D PTR_ERR_OR_ZERO(cec->adap);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/tegra-cec/tegra_cec.c b/drivers/media/p=
latform/tegra-cec/tegra_cec.c
index 447bdfbe5afe1..20b9fe9868ec7 100644
--- a/drivers/media/platform/tegra-cec/tegra_cec.c
+++ b/drivers/media/platform/tegra-cec/tegra_cec.c
@@ -327,6 +327,7 @@ static const struct cec_adap_ops tegra_cec_ops =3D {
=20
 static int tegra_cec_probe(struct platform_device *pdev)
 {
+	const struct cec_connector_info *conn_info;
 	struct device *hdmi_dev;
 	struct tegra_cec *cec;
 	struct resource *res;
@@ -400,9 +401,11 @@ static int tegra_cec_probe(struct platform_device *pde=
v)
 		goto clk_error;
 	}
=20
+	conn_info =3D cec_notifier_get_conn_info(cec->notifier);
+
 	cec->adap =3D cec_allocate_adapter(&tegra_cec_ops, cec, TEGRA_CEC_NAME,
 			CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL,
-			CEC_MAX_LOG_ADDRS);
+			CEC_MAX_LOG_ADDRS, conn_info);
 	if (IS_ERR(cec->adap)) {
 		ret =3D -ENOMEM;
 		dev_err(&pdev->dev, "Couldn't create cec adapter\n");
diff --git a/drivers/media/platform/vivid/vivid-cec.c b/drivers/media/platf=
orm/vivid/vivid-cec.c
index 4d822dbed9726..ef15c9c58c2a6 100644
--- a/drivers/media/platform/vivid/vivid-cec.c
+++ b/drivers/media/platform/vivid/vivid-cec.c
@@ -283,5 +283,5 @@ struct cec_adapter *vivid_cec_alloc_adap(struct vivid_d=
ev *dev,
 		 is_source ? dev->vid_out_dev.name : dev->vid_cap_dev.name,
 		 idx);
 	return cec_allocate_adapter(&vivid_cec_adap_ops, dev,
-		name, caps, 1);
+		name, caps, 1, NULL);
 }
diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/=
pulse8-cec/pulse8-cec.c
index ea9ee74fa3365..22adcce739fdd 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -656,7 +656,8 @@ static int pulse8_connect(struct serio *serio, struct s=
erio_driver *drv)
=20
 	pulse8->serio =3D serio;
 	pulse8->adap =3D cec_allocate_adapter(&pulse8_cec_adap_ops, pulse8,
-					    dev_name(&serio->dev), caps, 1);
+					    dev_name(&serio->dev), caps, 1,
+					    NULL);
 	err =3D PTR_ERR_OR_ZERO(pulse8->adap);
 	if (err < 0)
 		goto free_device;
diff --git a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c b/drivers/me=
dia/usb/rainshadow-cec/rainshadow-cec.c
index d9964da05976b..8681e4d6b3d59 100644
--- a/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
+++ b/drivers/media/usb/rainshadow-cec/rainshadow-cec.c
@@ -323,7 +323,8 @@ static int rain_connect(struct serio *serio, struct ser=
io_driver *drv)
=20
 	rain->serio =3D serio;
 	rain->adap =3D cec_allocate_adapter(&rain_cec_adap_ops, rain,
-					  dev_name(&serio->dev), caps, 1);
+					  dev_name(&serio->dev), caps, 1,
+					  NULL);
 	err =3D PTR_ERR_OR_ZERO(rain->adap);
 	if (err < 0)
 		goto free_device;
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 97ce790a5b5aa..eeb42abc343c6 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1208,6 +1208,7 @@ struct drm_dp_aux_msg {
=20
 struct cec_adapter;
 struct edid;
+struct drm_connector;
=20
 /**
  * struct drm_dp_aux_cec - DisplayPort CEC-Tunneling-over-AUX
@@ -1220,8 +1221,7 @@ struct edid;
 struct drm_dp_aux_cec {
 	struct mutex lock;
 	struct cec_adapter *adap;
-	const char *name;
-	struct device *parent;
+	struct drm_connector *connector;
 	struct delayed_work unregister_work;
 };
=20
@@ -1418,8 +1418,8 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum=
 drm_dp_quirk quirk)
=20
 #ifdef CONFIG_DRM_DP_CEC
 void drm_dp_cec_irq(struct drm_dp_aux *aux);
-void drm_dp_cec_register_connector(struct drm_dp_aux *aux, const char *nam=
e,
-				   struct device *parent);
+void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
+				   struct drm_connector *connector);
 void drm_dp_cec_unregister_connector(struct drm_dp_aux *aux);
 void drm_dp_cec_set_edid(struct drm_dp_aux *aux, const struct edid *edid);
 void drm_dp_cec_unset_edid(struct drm_dp_aux *aux);
@@ -1428,9 +1428,9 @@ static inline void drm_dp_cec_irq(struct drm_dp_aux *=
aux)
 {
 }
=20
-static inline void drm_dp_cec_register_connector(struct drm_dp_aux *aux,
-						 const char *name,
-						 struct device *parent)
+static inline void
+drm_dp_cec_register_connector(struct drm_dp_aux *aux,
+			      struct drm_connector *connector)
 {
 }
=20
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index 57b3a9f6ea1d5..7e39c10672a2d 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -24,6 +24,8 @@ struct cec_notifier;
  * device and connector tuple.
  * @dev: device that sends the events.
  * @conn: the connector name from which the event occurs
+ * @connector_info: relevant only if the call is used to create a notifier=
,
+ *   the connector's info to associate with new notifier.
  *
  * If a notifier for device @dev already exists, then increase the refcoun=
t
  * and return that notifier.
@@ -33,8 +35,10 @@ struct cec_notifier;
  *
  * Return NULL if the memory could not be allocated.
  */
-struct cec_notifier *cec_notifier_get_conn(struct device *dev,
-					   const char *conn);
+struct cec_notifier *cec_notifier_get_conn(
+			struct device *dev,
+			const char *conn,
+			const struct cec_connector_info *connector_info);
=20
 /**
  * cec_notifier_put - decrease refcount and delete when the refcount reach=
es 0.
@@ -79,6 +83,14 @@ void cec_notifier_register(struct cec_notifier *n,
  */
 void cec_notifier_unregister(struct cec_notifier *n);
=20
+/**
+ * cec_notifier_get_conn_info - get connector info associated with a
+ * notifier.
+ * @n: the CEC notifier
+ */
+const struct cec_connector_info *
+cec_notifier_get_conn_info(struct cec_notifier *n);
+
 /**
  * cec_register_cec_notifier - register the notifier with the cec adapter.
  * @adap: the CEC adapter
@@ -99,8 +111,10 @@ void cec_register_cec_notifier(struct cec_adapter *adap=
,
 struct device *cec_notifier_parse_hdmi_phandle(struct device *dev);
=20
 #else
-static inline struct cec_notifier *cec_notifier_get_conn(struct device *de=
v,
-							 const char *conn)
+static inline struct cec_notifier *
+cec_notifier_get_conn(struct device *dev,
+		      const char *conn,
+		      const struct cec_connector_info *connector_info)
 {
 	/* A non-NULL pointer is expected on success */
 	return (struct cec_notifier *)0xdeadfeed;
@@ -119,9 +133,15 @@ static inline void cec_notifier_set_phys_addr_from_edi=
d(struct cec_notifier *n,
 {
 }
=20
+static inline const struct cec_connector_info*
+cec_notifier_get_conn_info(struct cec_notifier *n)
+{
+	return NULL;
+}
+
 static inline void cec_notifier_register(struct cec_notifier *n,
-			 struct cec_adapter *adap,
-			 void (*callback)(struct cec_adapter *adap, u16 pa))
+			struct cec_adapter *adap,
+			void (*callback)(struct cec_adapter *adap, u16 pa))
 {
 }
=20
@@ -155,7 +175,7 @@ static inline struct device *cec_notifier_parse_hdmi_ph=
andle(struct device *dev)
  */
 static inline struct cec_notifier *cec_notifier_get(struct device *dev)
 {
-	return cec_notifier_get_conn(dev, NULL);
+	return cec_notifier_get_conn(dev, NULL, NULL);
 }
=20
 /**
diff --git a/include/media/cec.h b/include/media/cec.h
index 707411ef8ba28..6e0f9b70d36f5 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -200,6 +200,8 @@ struct cec_adapter {
 	u32 sequence;
=20
 	char input_phys[32];
+
+	struct cec_connector_info connector_info;
 };
=20
 static inline void *cec_get_drvdata(const struct cec_adapter *adap)
@@ -233,10 +235,12 @@ static inline bool cec_is_registered(const struct cec=
_adapter *adap)
 	((pa) >> 12), ((pa) >> 8) & 0xf, ((pa) >> 4) & 0xf, (pa) & 0xf
=20
 struct edid;
+struct drm_connector;
=20
 #if IS_REACHABLE(CONFIG_CEC_CORE)
 struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
-		void *priv, const char *name, u32 caps, u8 available_las);
+		void *priv, const char *name, u32 caps, u8 available_las,
+		const struct cec_connector_info *connector_info);
 int cec_register_adapter(struct cec_adapter *adap, struct device *parent);
 void cec_unregister_adapter(struct cec_adapter *adap);
 void cec_delete_adapter(struct cec_adapter *adap);
@@ -331,6 +335,9 @@ void cec_queue_pin_5v_event(struct cec_adapter *adap, b=
ool is_high, ktime_t ts);
 u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 			   unsigned int *offset);
=20
+void cec_fill_connector_info(struct cec_connector_info *connector_info,
+			     const struct drm_connector *connector);
+
 #else
=20
 static inline int cec_register_adapter(struct cec_adapter *adap,
@@ -365,6 +372,13 @@ static inline u16 cec_get_edid_phys_addr(const u8 *edi=
d, unsigned int size,
 	return CEC_PHYS_ADDR_INVALID;
 }
=20
+static inline void
+cec_fill_connector_info(const struct drm_connector *connector,
+			struct cec_connector_info *conn_info)
+{
+	memset(conn_info, 0, sizeof(*conn_info));
+}
+
 #endif
=20
 /**
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 3094af68b6e76..14097023ce171 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -411,6 +411,27 @@ struct cec_event_lost_msgs {
 	__u32 lost_msgs;
 };
=20
+/**
+ * struct cec_event_connector - tells if and which connector is associated
+ * with the CEC adapter.
+ * @card_no: drm card number
+ * @connector_id: drm connector ID
+ */
+struct cec_drm_connector_info {
+	__u32 card_no;
+	__u32 connector_id;
+};
+
+#define CEC_CONNECTOR_TYPE_NO_CONNECTOR	0
+#define CEC_CONNECTOR_TYPE_DRM		1
+struct cec_connector_info {
+	__u32 type;
+	union {
+		struct cec_drm_connector_info drm;
+		__u32 raw[16];
+	};
+};
+
 /**
  * struct cec_event - CEC event structure
  * @ts: the timestamp of when the event was sent.
@@ -475,6 +496,9 @@ struct cec_event {
 #define CEC_G_MODE		_IOR('a',  8, __u32)
 #define CEC_S_MODE		_IOW('a',  9, __u32)
=20
+/* Gets the connector info */
+#define CEC_ADAP_G_CONNECTOR_INFO _IOR('a',  10, struct cec_connector_info=
)
+
 /*
  * The remainder of this header defines all CEC messages and operands.
  * The format matters since it the cec-ctl utility parses it to generate
--=20
2.18.1

