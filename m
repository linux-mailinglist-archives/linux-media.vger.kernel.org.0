Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF85D2E841E
	for <lists+linux-media@lfdr.de>; Fri,  1 Jan 2021 17:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbhAAQD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Jan 2021 11:03:59 -0500
Received: from mout.gmx.net ([212.227.15.19]:45199 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726747AbhAAQD6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 Jan 2021 11:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609516944;
        bh=9uAnbEhyZD6TGPwVlCPtZ/QXZccE+izuatvELYWZEVc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=eHVXEd//6wELJGPjKjV3pelnev1UV6vZonGGaEECKqVtSvquyYVzj0wKt1R6PS1XE
         0hrc2j/EV8TqIc+UNFlhWWsavjJoeAJX0XvFnj5HhPUYfsyj8uC4otPmNDUen7MuvC
         hOSCpmwT3+e/1gMWf/lJbxt9zD6+8ECrQG9OSQt4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.57]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhUE-1kGr4O1xzA-00nf7I; Fri, 01
 Jan 2021 17:02:24 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: dvbdev: Switch to new kerneldoc syntax for named variable macro argument
Date:   Fri,  1 Jan 2021 17:02:11 +0100
Message-Id: <20210101160211.772633-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VFZ8b0/yJm9NHDI/2A1ktAZFNBp4uA6hvEbbLPERMiL6hBU9rku
 dyW26JDwZmTncl+wD+FbWeYZH+CmUoRo+NHd15udkzZN+xz0JcGTEf2Dqy8f762+Aw0vJth
 fXXkbOq3/up3USbkdYvnnuwq7mB44uv1aO/fMLrNLH8qKtT/uJcqCBjaK0rkEdnQ7zbe3z+
 cYhuayhR4yZ/6WiscdhkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:18aKXujhXq0=:YAnQ63dkf1O21MXljur/BW
 oHYVdAN8hXtkAoJdBBBzo3Kx+4Q1xuLFex78k9iG0ssm5HgSu19KNTMpuOSUf8BCrPz8qFe+q
 7nYo2AB5rSZjfV9IIiG+O/Sy0wLNCCKRzx8Hlpz0aDhf81nZkcKmc10KAXhlk0WFqwFTlG7r3
 mNH2Dfo5+9xJDNJMeRvi6CyWv1Cd4nW+7noG1VC9mlckb485OvlLjpUyrAfY1Ktxm5zIJHuzC
 97/6SgI6uh89CRJpJoAwaDGhyPqhw8buWpL6/KfLJDtOGafGX1CKYiwOuDSWJIMGjGqhvhMUC
 oHEEPOW+gvv/DranBSq5/6YueTQzb+XeiZBIZn1KF6vABeKOAu69IfKnxPxAgguEgrwmtbf+i
 s47gLAMOEBDyZ9xLiUbEVU+g4tA5NVlD3Rj+zriePPm87psGViRX8e8hyKa2PdZcf0Gw1cWv8
 iJ4yeZsbaVmnfGECY8rm28kLO02dV/EPAOOT375gKY2gGCADSeHYkZGjA1tlKJ/FXPFZ/sKqa
 w9zkf9N3U6wDZOQ+at/dsuswlDuM3U366PKft5roWa8q0nIcSXxC480QCJ2QNzCSjkO9EIiix
 1rTXiIandahal53JZzhSUTUZjQ665gNOc/QCNy9w+lDppwxH0rDpvxdJqBklXW4d+/0nzqOVg
 BdclWY0ZOGd2Lv1hzMistKfhrKeER28qGO/5+xB6GA4nOn+RtRyft2bklbjWMyKSoEqqQCWFf
 71Awc9YXvP+5F51z++LRxEcSHGgU2N8hDQ5C5ZW88CYUvTycDCwJJIGGwLHPcFi0ZcXtTpA+d
 bIGUadZCE6Ja9vnOXp137qvNaom/STLENhPfEijnDrXBo5aAwWA028QFVFeGyvTierZ7RqFQl
 6PQWFs3Hu3DPGG7wRtYA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The syntax without dots is available since commit 43756e347f21
("scripts/kernel-doc: Add support for named variable macro arguments").

The same HTML output is produced with and without this patch.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/media/dvbdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index e547cbeee4310..cc85df91ee7c6 100644
=2D-- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -421,7 +421,7 @@ void dvb_module_release(struct i2c_client *client);
  * dvb_attach - attaches a DVB frontend into the DVB core.
  *
  * @FUNCTION:	function on a frontend module to be called.
- * @ARGS...:	@FUNCTION arguments.
+ * @ARGS:	@FUNCTION arguments.
  *
  * This ancillary function loads a frontend module in runtime and runs
  * the @FUNCTION function there, with @ARGS.
=2D-
2.28.0

