Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C199817299E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 21:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbgB0Umx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 15:42:53 -0500
Received: from mout.gmx.net ([212.227.15.18]:48587 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgB0Umw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 15:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582836168;
        bh=PHxdA84CrVPUIQek2Fft/b4EaOEn4nC0NYq+qVH2pGQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=XTOT3JI4FLsMtWNreRSOt6sFzctcr3KXD4ItJGqY/5rwo54JfZaJ0EYgCv1EIw1j1
         4P2GJTbCxIqDKqJgqelCUViOO204MHYCQGn8gicC0nK5zkbTRx1J9OR765JDJx9nAF
         liD5Qo1y/Gi3p6gbwQ6oAOcugIpkNrrDe/Qswh2Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.162]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYLa-1jaA6p3lf6-00g46V; Thu, 27
 Feb 2020 21:42:47 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2: Switch to new kerneldoc syntax for named variable macro arguments
Date:   Thu, 27 Feb 2020 21:42:36 +0100
Message-Id: <20200227204237.24620-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uk5ZfMvYwaTXAmyp41ifb0s/h/5zpkPMsArdN+226tMoQwFFJge
 z5e5eRWKvIfYMhJzlXhjabY63A2c3s1+i9+ViGiidru4KsmxT6ZAPWGHHTd2jdioUNC0CQ3
 0N/XpDDIdMP2QB2w9psYTE44caliSzwbfuRFr1HmyZtLWvbVS8JsfddU9vBkzm5ZAEAzP8p
 YLya3VVyLmUy0T9oyx7yw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wfuyONb7hyM=:YUyJNxnd0v83v1a3K5hMHo
 8IogDwoDNww1c9s53aLv5GkcyvYTDgTqdnMqSDxJrAgVKqdQFomXI0Jp4MnwyYaQXL4qpztiu
 qeap7PZCdYJl1KoF6UjirqAc0PdTYxBEJouURpVv9dsgoMEImFOVSlSJfNphJwTuGDvHBwY61
 Dx0fHmbNo48Tqh5CIjlkFgRkg+2toaolJ42DHqdpEdlCpprHIXpHOa1wvSYZaeveP6q2gDbO4
 kuzRuJ/s43nAasTr/kRSW8Cjm5lQrZgamOWyxjq9R7p19dw7I1tZvlSiuHZDpABamWzmWRGFl
 nYjYlmkgouqrpbBeQRGmTcKi8QPxOcxmGdI/Z8SdM09OwWpb97z4AsSxrj1lAbspg+VadKWpu
 iAhsDqsH1BJSrNEOjLRaq6C/vlOOSCGYlsyr9Eg4OUAb7hfZ3LlucvkRzRW8B/Lk0jg6dGNFN
 SE0+DlQYEoilacOeyfTCs1k+n0iL4O63988O2MimQHaiKUCwo2LDIwSf0PLqzEIdPtgFU7EFV
 6FdgzAQoZh1NBu8PxXR8ak+kZyEj8aW7Lsl5mt+YzMZOJUDG0au9k/HX7nmK5SGMG4kAMKEM0
 77xWvNVMVi5puYggzG7+hiQizV+ac4iC5KsdVJxhf4lAmGY7p+PQ7KWeIVecF9dINri1KHeXE
 G+XrG6HwcRL8lA+druv8OLlvL+8brksv+K230Lz2of0MLzd+Aycp1tG/6N04CCEJX0rt/pkbZ
 4j+1D/mctzcrZZBXs7WHz/7Rs8Jg9Wm4H5sbks8uNAhBIy6SBit6/hmvHa2+PaSgXDM6njvEq
 b7KBWQuul/MpJTdiSltWEWYtLRKi7toh5XWQT758vtU5X+kt05fCtbEOKfYA/IjX/gcAIS7gA
 QDKZHeELBsIBQbkSjCkCEQG5QhNr6dClsUqiJarOAhg0gJ9Z6jc6f/c1O5yYBXJZbcWenR80i
 5+otE8ZPjqeNNV29l2rCngcSOWlH+nv97BmtH00DOFDY+DVHeqBNtN9YQ7BiYJ+B7uwFbhElo
 lLJ9HqEtHmd01T4Krrj05gUGsqS+bVSEGBnYTdsaFVMFqMczatbbpO5yLpnk0BdqIzCFC1pKM
 B6ZUOm1Yi/P1URsB294RiMuRA+Bh0YthmeMv0GiQrTJNiVbY9HxxhudBu2FfiFGIv6rrfig8m
 LLX9M0riUluqhGqcWX24T7YVnUj0zCvE9gDKIIFV3LrqrASZmWxpebvmfqUaFtI+skvOtnb6e
 yWnG+eMyvxlopjLqU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new syntax is available since commit 43756e347f21
("scripts/kernel-doc: Add support for named variable macro arguments").

The same HTML output is produced with and without this patch.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/media/v4l2-device.h | 16 ++++++++--------
 include/media/v4l2-subdev.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
index 95353ae476a1..7c912b7d2870 100644
=2D-- a/include/media/v4l2-device.h
+++ b/include/media/v4l2-device.h
@@ -240,7 +240,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Ignore any errors.
  *
@@ -265,7 +265,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Ignore any errors.
  *
@@ -293,7 +293,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Return:
  *
@@ -328,7 +328,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Return:
  *
@@ -359,7 +359,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Ignore any errors.
  *
@@ -388,7 +388,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Return:
  *
@@ -419,7 +419,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Ignore any errors.
  *
@@ -447,7 +447,7 @@ static inline bool v4l2_device_supports_requests(struc=
t v4l2_device *v4l2_dev)
  * @f: operation function that will be called if @cond matches.
  *	The operation functions are defined in groups, according to
  *	each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Return:
  *
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 761aa83a3f3c..a4848de59852 100644
=2D-- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1093,7 +1093,7 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call=
_wrappers;
  * @f: callback function to be called.
  *     The callback functions are defined in groups, according to
  *     each element at &struct v4l2_subdev_ops.
- * @args...: arguments for @f.
+ * @args: arguments for @f.
  *
  * Example: err =3D v4l2_subdev_call(sd, video, s_std, norm);
  */
=2D-
2.20.1

