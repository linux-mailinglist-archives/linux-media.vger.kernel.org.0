Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABD01E8852
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 22:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgE2UA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 16:00:59 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgE2UAx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 16:00:53 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MvbO4-1ipghK3Ghq-00saMm; Fri, 29 May 2020 22:00:40 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/9] staging: media: atomisp: annotate an unused function
Date:   Fri, 29 May 2020 22:00:25 +0200
Message-Id: <20200529200031.4117841-3-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529200031.4117841-1-arnd@arndb.de>
References: <20200529200031.4117841-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lfZ3e7lRj4Ybe7StyQFbwkg2UGWjMbId3/8VrkKq0pNLWCLtM32
 kC18Il1MDaISgD8gL2sMI5OwZFnVA3Rp33VA5sfA/Q7v/zYyARV33SRjZVjcGToRqQsksR5
 KzWi9fEMSZvDjbXjeXC4SnaJQNdaCvhSbb99ZlJqDMlLiXk9jIhHcedSRmM/hNHAvuF0OTP
 t2vLHRR7riPg7pNu9GOXw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+LkRWSfmL0E=:9l56I5kcdmKr3QZXmDnZ+S
 sXoyK6fxxiDQqDFYRgOZG2PDT38WNHL+fT4N0cyDhyxZ4bsn77lxBIDZ31hbz3aM8pQ0DgzXK
 rovnECe6vjyY2EnMqLW62m45LXfkPeJ/hyTQ96DYeDNdWNFQof98gkgpEMlMVgQ4yimM5fIbC
 Qhv4IDC+Sx/28RHUQduOzPVCauzNO3zTnm3HyYj9+b5FSUJakM9WfHP2SWtW7+iNuRUs7JcEd
 QlZLrH+IADO71tIplE+RSZITLkv6YlQH3ccpo7CEBx+MXImuJWD5deMVvVKKGzD+IFhjg8nPn
 e/m2nQion0ZiG5uVTKvBdNxwjVhGw4noq4xdvayzpCgjjU4P4ZtUhUfIWs5qkxFRK6ymof5Me
 SKpsU/bV/yROi3suZ3+Z3Irscj5+UrIm1uUfudlpYAvb5qMUOtxMixamm51+lWJylZqFaSfGY
 gOFfr21E/HeWSr8IRE6+MUjXGaycqP9gwBEnGtpo89kk7tHdDdoeSbFK32BXB4llhRfNU8Anh
 2P7352T7x4aTMG1aj9lSUhXv8IM/IMWCuKrsbm1Rl4h52PZAZor/fRo6fqfsguCY/nil7xaxa
 6PlYDAvOdVDjaN4JcyvOK33SLdNQlJSPaZMIraTwRpn3HIkyP1h74NRReHH2lWgJ7eFZLCfEc
 bF8eHDs7hMIrsall0NEeNunR8yKDu/k7EHvejkji6GpHpl7aVFE37fEiuu3n8zs6c2UKSofRn
 z6tyFC9id+MrlOQLkqqoeEzmtEG6POwljWd0GxEJvar1K+zhPo4Ra7SHUrkyQCalwrJ9TGg4o
 3n+z/OwgfyZ88xgp90YW//B2L/jkaQ3Fh1dLg0ZoJtaVp5icug=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

atomisp_mrfld_power() has no more callers and produces
a warning:

drivers/staging/media/atomisp/pci/atomisp_v4l2.c:764:12: error: unused function 'atomisp_mrfld_power' [-Werror,-Wunused-function]

Mark the function as unused while the PM code is being
debugged, expecting that it will be used again in the
future and should not just be removed.

Fixes: 95d1f398c4dc ("media: atomisp: keep the ISP powered on when setting it")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 694268d133c0..10abb35ba0e0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -761,7 +761,8 @@ static void punit_ddr_dvfs_enable(bool enable)
 		pr_info("DDR DVFS, door bell is not cleared within 3ms\n");
 }
 
-static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
+static __attribute__((unused)) int
+atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 {
 	unsigned long timeout;
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
-- 
2.26.2

