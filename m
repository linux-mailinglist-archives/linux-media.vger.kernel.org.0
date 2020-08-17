Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15AD247A6C
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 00:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgHQW04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 18:26:56 -0400
Received: from mail.v3.sk ([167.172.186.51]:54084 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726793AbgHQW0y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 18:26:54 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 6D40BDFA74;
        Mon, 17 Aug 2020 22:08:02 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ApFcZkuIBkNP; Mon, 17 Aug 2020 22:08:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id A3534DF92E;
        Mon, 17 Aug 2020 22:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0gOhhw_Uly4c; Mon, 17 Aug 2020 22:08:00 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 58D58DF880;
        Mon, 17 Aug 2020 22:08:00 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] media: marvell-ccic: Add support for runtime PM
Date:   Tue, 18 Aug 2020 00:08:46 +0200
Message-Id: <20200817220850.401287-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a second version of the patch set that enable runtime PM for
mmp-camera. The ultimate goal is to conserve power on MMP3 where the
camera block lives on a separate power island whose genpd should be
turned off when the camera is not in use.

The previous version of the set contained only one patch, that is now
last in the set. It was modified to move clock handling to the runtime
PM callbacks:

  [PATCH v2 4/4] media: marvell-ccic: add support for runtime PM

The previous two are new and they lay foundation for the patch 4/4:

  [PATCH v2 2/4] media: marvell-ccic: mmp: get rid of mmpcam_devices list
  [PATCH v2 3/4] media: marvell-ccic: mmp: use generic dev_pm_ops

The first one is not strictly related to the rest, it just makes things
a bit nicer for the version of marvell-ccic found on the Cafe chip and
consistent with what's done for mmp-camera:

  [PATCH v2 1/4] media: cafe-driver: use drvdata instead of back-casting

Please take a look and consider applying.

Thank you
Lubo

