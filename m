Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D48458A47
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbfF0S5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:13 -0400
Received: from mout.gmx.net ([212.227.15.19]:56599 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbfF0S5M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661809;
        bh=jFtiONca1hdVFxm/usbMzIOKsZXNfYtIs0InExv49OQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=D2n/GfnRCEz2ywceZA/kKouLEZ8IkCehCjlO5aCmz5+tC8z030yAjvdqyB0woCQeN
         H09IhGDFTlzXp9AbFu9SJX3i2YwAk1/NGSQ1+j+NCrJwtEvKmh9tgOeu+CTO3Renvy
         fzrN02XCH8IWytAfITKVaxSZm8rhnIDEreVKRfko=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M92lh-1hqF922WeD-00CQcQ; Thu, 27 Jun 2019 20:56:49 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 03/31] staging: bcm2835-camera: Replace spinlock protecting context_map with mutex
Date:   Thu, 27 Jun 2019 20:56:00 +0200
Message-Id: <1561661788-22744-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:D2AkJfxcnXtCj6sokPxOpiTqs4No+MBrwT2O1aUmi8Tnu7VKWpY
 ZFyRQTMI7ZkQVPnbVGSo2fbjdP/sTozwpiHjpLkN4cGBYUtit3jU8k6ejuGXndm024u31kq
 CEMvzZJtgy68BFC4kNFKSOKqeMU56wyUQr1OTrnVo/ptijmkU1vNNLav5iuMGT5yAsO/KKl
 mOW8FQsL6mvuvLq2Hd5Wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YoEFoI43RE0=:uqiLpOzWe7CCbDvKSmvf4u
 hv6fV2QWvbr6aOXQD1uX8MtNNg4lU2dk3lQFsfOA7Meu1Pn79kuJnEe08ilfhnMeQpwzmkbMD
 TTdRUaCm0ntceexWCPrXahYEgeAzp7TeH2eEL9LHNHdh/Tm1fUupwq2Tzv4tZrBGX1bhRn0Kw
 V2XOP0rE07+F8dS5YLd5nREB+Z4KqIG5Wny37p62GEK0lfyN/mIBLoq7R6m5IPJ3gPG26ienD
 hJg9N9oyV4VhrKmTDEb4dCdfhQnIKCD9MWAAzA4jeSvN95bZ+aTRnTNpnRxWSkS4ZfvGUZet5
 BernveDdnDGOR3W9W/nN+aH0zZnBITGvFNV0Ctnc0m0GJ3wciwIfZfYKNoV7TRuJKtH9G0dwm
 Gf1Rsc96auPYWwGGw0qnBeY+nj5yZeSVNJoqfYutoSoYvFtIcwlfDtn6r0+KUH4NHfzYKFXDF
 +QzjdCKEADgsVpF+w2J/m7pYLj+6NTCE536Qwf2ATTHxjeN2DK8PP0P0xdrtXW6J8ob6UQpzJ
 aYVIXFUiw/KTdc94/LDrbwix9ehCsdtWfglwLjVEoZRjWe2M7/V9cXSKCAkCjRqqxABbKS//s
 cFmgH7rLOo45JZQiDU3Ph0c9ZAOdt4tk5rrc4HMK4IA1/Y5OGb272uohTkfZc8+OsuzPsCwdU
 JTZ+tJW9TKlMxcKqgoBPj2znffLz9ZkBReeFgxacfR8yEY48M6x7mLaybZZbMUyalldj56jGu
 ugn05DtisHQ3NQtsAe7ExK5Ql4d1snFZKfXg2dipIzUv+ePlv/tsDSd/f4fYHjIr1BFf+ACA5
 uUaQHjSfmPBEEXEdt9xoayihczLwsbDSFkPNtooeSWW68mcTdloMXaexBfMYY5RtzssS4KsHI
 j/hVtzOa97dzujhsSCXqJ3xV+tETDYzIkC3tmmJkMSinxsJOEb8JDuGPRrM9MwZvSRMpHCIO9
 Ne0uTNT5KJ/ilJVdNLXLCsqc1DIv1AG/ytGM6zhRVNGmvHB+0EnCoSyHIeMolWrbMaBcvn60x
 pTdHScginuRG8EVT4wxqihbRRwPjOuAW1o7qExTSK98mJCmGFSJY8gmavl+8/K44NSBb6TYpj
 BMG0VCs1qIKoKo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The commit "staging: bcm2835-camera: Replace open-coded idr with a struct =
idr."
replaced an internal implementation of an idr with the standard functions
and a spinlock. idr_alloc(GFP_KERNEL) can sleep whilst calling kmem_cache_=
alloc
to allocate the new node, but this is not valid whilst in an atomic contex=
t
due to the spinlock.

There is no need for this to be a spinlock as a standard mutex is
sufficient.

Fixes: 950fd867c635 ("staging: bcm2835-camera: Replace open-coded idr with=
 a struct idr.")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c | 13 +++++++---=
---
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 16af735..f1bb900 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -161,7 +161,8 @@ struct vchiq_mmal_instance {
 	void *bulk_scratch;

 	struct idr context_map;
-	spinlock_t context_map_lock;
+	/* protect accesses to context_map */
+	struct mutex context_map_lock;

 	/* component to use next */
 	int component_idx;
@@ -184,10 +185,10 @@ get_msg_context(struct vchiq_mmal_instance *instance=
)
 	 * that when we service the VCHI reply, we can look up what
 	 * message is being replied to.
 	 */
-	spin_lock(&instance->context_map_lock);
+	mutex_lock(&instance->context_map_lock);
 	handle =3D idr_alloc(&instance->context_map, msg_context,
 			   0, 0, GFP_KERNEL);
-	spin_unlock(&instance->context_map_lock);
+	mutex_unlock(&instance->context_map_lock);

 	if (handle < 0) {
 		kfree(msg_context);
@@ -211,9 +212,9 @@ release_msg_context(struct mmal_msg_context *msg_conte=
xt)
 {
 	struct vchiq_mmal_instance *instance =3D msg_context->instance;

-	spin_lock(&instance->context_map_lock);
+	mutex_lock(&instance->context_map_lock);
 	idr_remove(&instance->context_map, msg_context->handle);
-	spin_unlock(&instance->context_map_lock);
+	mutex_unlock(&instance->context_map_lock);
 	kfree(msg_context);
 }

@@ -1849,7 +1850,7 @@ int vchiq_mmal_init(struct vchiq_mmal_instance **out=
_instance)

 	instance->bulk_scratch =3D vmalloc(PAGE_SIZE);

-	spin_lock_init(&instance->context_map_lock);
+	mutex_init(&instance->context_map_lock);
 	idr_init_base(&instance->context_map, 1);

 	params.callback_param =3D instance;
=2D-
2.7.4

