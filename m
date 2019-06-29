Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE935AB08
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbfF2MtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:49:20 -0400
Received: from mout.gmx.net ([212.227.17.22]:33073 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbfF2MtS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561812539;
        bh=4iT5gF19zR8hUXulIRPknsdJWyLCby3wqEEHdRNSk3A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YvN0BbkOlfSvFcV2O+lPHn26R8lyReJT0CPmnS2EIkF8sYaqGgd9MosoAXZtZda0C
         4dc9R2f7m9chVTyKenUkvHudXQHfnZwpUkhBhQCPde4apsxCrFzAhP+rA2003iPb6b
         3l+eowotvMhmqpbiNfqp6WhIwoC34YdJ6KMwz7Hg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTiPl-1i8Nlu1iW5-00U2yt; Sat, 29 Jun 2019 14:48:59 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 19/29] staging: bcm2835-camera: Unify header inclusion defines
Date:   Sat, 29 Jun 2019 14:48:26 +0200
Message-Id: <1561812516-9087-4-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561812516-9087-1-git-send-email-wahrenst@gmx.net>
References: <1561812516-9087-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:bsXBO01Rf/+xETfFo6MMrEg0HQCUn+iJ1mvOniUeTwdV0AmV80s
 P2rvUsoq4Zk7P2PjYaEAI7O1szcBJ40KZ9VuN+iomXI2v73JQsGLUff2gj4pozrn5ecviet
 oUhYz8jlCWLp8gC/P1HFEyUYr9SC+oD2BXjx8KcLYOLinEf82aejjl8sYvA5v4LzLN7lH4O
 NYV36VJyp52os1pQ9n+nw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IK9BCJsBPhI=:/aFg9LoBlc8/Uq3MhJgRbh
 4UMIWHkd6LJVRqW9lp0d+P9ouLOXZt+s31UxoLTiph23EAqud3RPWkZHu+mCejpN/RLJGhrOS
 OcBms0lg8R4S1h1n3XQm1d4PHgaTw2nNY2grRHI/vEtR3qgMF4QAMN9NbWLTyjppTGrFrIaAt
 b3AESdhNBJx+yZkRVdQlI12S3kn8Z55da2DXlkFOC+g51EURI7blz/FeF2sTTtbyOWArFFTXp
 dSE/A3Z6qfYN/vNiHI0JKyhAAu2FVQ1DLv54evuvnZbHZCZRQLT8WcsQZj+kcsjiPfcqqYxTI
 ECnSZPLTniwkZsIqq9oTttX+/UDVFrck+Gm2ZQYN3mBffXx491TDdb41q1bJ/0F5r0owIcT8d
 KjQAfAR15+Xtt1tkvNjOOqVdKS3PrvSajclktcxT5oYNnpytVfF2VTKVbob7yrJ3HA2YwEur0
 MJVUWUXOZzTdadnl6DPsRKBkVbyauKxPsjfkOfpQM6pkAPgffwpveAfQ2TqZgoHfvFkVwgWIM
 nM65xCwhnq++q2pT/r02y2nupqtFJChEZfXqG6O4cgqXwp4yjM01GS0draQWvBKYq/vup0KAt
 fMTTVvglL+zGZ9ZOCIWhib0ikdN8LKDnnEjWXVljJ4u+MKijFvvTIKZkraXaCkvUSaBYlddI1
 QkHgGfjSNR2xJTOaCwZXJpRPN58/8GAK3WfKobTJ/2WJHX6vP7d0i88V+HpYb+HJ9t+mPtiRR
 N8lcuqa9nwYMbV93RnsMb3auXwLLDmd1vaElc5KXWBU8spusrnCUvswbCMDhzMCeobYaC2TFv
 7xkrZGOCTJk44hZ1/4vcMhEqchEGQ3cO1CzEHLUmlAHRYzLIQ+iJO/MoEwqOLvDt/QBh2eJZ3
 rQ6bk7LPODReaMFaMvkB/Ip+zCbXXjdYtVcUMkKkrIgzsLuNjjSRYEyDZP5pL+8KHPAhsTVQB
 qxj2ZCWmx2RCiFHwTqBR/y4eOF7GcEhzISahiedJeFgw1uYaPluiucSJP1RyNJguAiprI4M8Y
 tfmfFodEcPnGpA5dEYrNqKAZlMBfzK+DgekuY2L1wQvRpL+gdCxrJxGjf47PeEgUzbF6iQsDw
 cbR8u+YaLxqCIU=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Most of the headers use ifndef FOO_H, whilst mmal-parameters.h
used ifndef __FOO_H.

Revise mmal-parameters.h to drop the underscores and make the
headers all consistent.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.=
h b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
index 6d21594..da21ec5 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
@@ -19,8 +19,8 @@
  * @{
  */

-#ifndef __MMAL_PARAMETERS_H
-#define __MMAL_PARAMETERS_H
+#ifndef MMAL_PARAMETERS_H
+#define MMAL_PARAMETERS_H

 /** Common parameter ID group, used with many types of component. */
 #define MMAL_PARAMETER_GROUP_COMMON            (0 << 16)
=2D-
2.7.4

