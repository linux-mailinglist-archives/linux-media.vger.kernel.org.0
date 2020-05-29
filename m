Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC391E8851
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgE2UA6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:00:58 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:46447 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgE2UAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:53 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N2E9Y-1j0dym29Bm-013cyq; Fri, 29 May 2020 22:00:42 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 9/9] staging: media: atomisp: add PMIC_OPREGION dependency
Date:   Fri, 29 May 2020 22:00:31 +0200
Message-Id: <20200529200031.4117841-9-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L0tAuZKqS3GUSyinflTIVejQer/+gUpZEMrHiizAn10eYDwYWoP
 ee/FEolfmeLefXoBmI6xD3EMOEsLS73UAjlN5kU0b9Hnbu3uEmAntK5dpuzgQzzWjgQ5+uA
 dCKcmC7jc3MIX9nWCN1NeMpHfr3M+gi9M73jO9QP/9K6UURab9n8KHZ4TAsN88OPAAfDQ56
 fMA50/pxymZgPMFMU5egg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n8lBOdB9moc=:gkSwrbVAcyBUdJIk/gy8rt
 z4c67AMI2vRcR9vlmbSsMYc2KDn2J0UfzfG5FHt5lV4uAjGr7+F7uTpeYrWn7uuL8g62oXTYy
 wBS7GN3THgQGHnI000soH0B2bOv2ERsfmkRjoVyjy7VlMrD28yDfI8ggaL850JAUxlurig8qG
 Gi3In92t6AC0XHB2dqYU31gz9zgdlKY9G1KjywOjaWXUNC2OvFa1Wz4brx5h6zJrTkJEwlS0E
 SSazvtRsynsPhxjYr5MuWibi1uWq3eN5kprruDdVOpmCxdOC/5mxwcb6XbpJFMyoGR3VTURo7
 PxDqwMD3d5RHWSkXyQHnZjWG3IWDQmeJZ861rwbf+NC3PCDe+X1wu1nTyXbMAtjQPjErjfSzo
 sK8KrpqE0Fgh8sCTVPHR8sH3Xb/iDDMfAJPE0ygxhqgjPuV0GsoXj3AtAUP739N0ok7CPh2YF
 /sybDxaavuMv1Zcj3p5Rd4411Z98rhY+mdgoYbWis+E6LkzAHNlKiCRj2WaFiPP3ZIC8aTzzj
 sj1izhMZWloGLOg0PwaPB7qcPnFaJ6wKL1GyJUdlC/8bva2Q/wBc7GOWQ/DrhFkkBiHYb2L2k
 JW3IcVYw+C62G9cgdkao6qQRnLjcXqmQQ0xTfXfRFbT3mSzwxPImNc9ZMB94ozM7wzTZttrXH
 RLx7iwwwOD6ut5hmCkKPms2ieS1ujXE6B04Ab7C1jvAf9JdTQDeTq/rftQndTYIUbnjfJxHuk
 TFtJJNj/3xJyLbTYEHF2qLvZNNPFG7/rWTf14k9YzjDmE/q7D1sZ6aAVLhv6cRR+j216RnzDa
 7gCKpfl8V4yXUtDX/VUorCL6JpIiG89ES774k7f5HLZnpeMSjU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without that driver, there is a link failure in

ERROR: modpost: "intel_soc_pmic_exec_mipi_pmic_seq_element"
[drivers/staging/media/atomisp/pci/atomisp_gmin_platform.ko] undefined!

Add an explicit Kconfig dependency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/Kconfig b/drivers/staging/media/atomisp/Kconfig
index c4f3049b0706..e86311c14329 100644
--- a/drivers/staging/media/atomisp/Kconfig
+++ b/drivers/staging/media/atomisp/Kconfig
@@ -11,6 +11,7 @@ menuconfig INTEL_ATOMISP
 config VIDEO_ATOMISP
 	tristate "Intel Atom Image Signal Processor Driver"
 	depends on VIDEO_V4L2 && INTEL_ATOMISP
+	depends on PMIC_OPREGION
 	select IOSF_MBI
 	select VIDEOBUF_VMALLOC
 	---help---
-- 
2.26.2

