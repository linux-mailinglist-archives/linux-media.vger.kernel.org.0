Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FEC27E13B
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgI3Ggm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:59274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727599AbgI3GgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DFD82075F;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=LhZCTorWgRAPqNW3nrFAAebOGXKRprPBrjQJqI6Zz6k=;
        h=From:To:Cc:Subject:Date:From;
        b=hLE55PtDImVghfSrFfBE9lp1evnzJjzixWmI31JLFMDkIJnDAiPB9SP6aUP7yXlKs
         ug3BdE3FWXUP+nkA4lKqX29CQ/4HekMfx1fWDBYa2j6GMYPnxua1qMfroRQRYzXLng
         ccSkxQBGr+vtF9UtGO347Ty2R4lazFf2mErLRjh8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmM-P1; Wed, 30 Sep 2020 08:36:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Address several issues when building media docs with Sphinx 3.x
Date:   Wed, 30 Sep 2020 08:35:53 +0200
Message-Id: <cover.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The C domain parser was re-written on Sphinx 3.x.

It is now a lot more pedantic than on past versions, and has
specific macros for addressing C namespaces and documenting
data types, like c:struct, c:enum, c:macro, etc.

I'm currently working on addressing the issues upstream,  as
some changes at the documentation build system are needed
(mainly kernel-doc and cdomain.py).

Yet, there are several simple issues at the media documentation 
that can easily be fixed without requiring any changes at the
documentation build system.

While Sphinx < 3.x doesn't print any warnings, I suspect that
most issues addressed here will provide either duplicated
cross-references and/or produce wrong output.

This series address those.

As there's no change at the documentation content
(just format tags were changed), my plan is to apply this series
either later today or tomorrow. 

Mauro Carvalho Chehab (9):
  media: camera-sensor.rst: fix a doc build warning
  media: glossary.rst: use the right case for glossary entries
  media: docs: ipu3.rst: rely at automarkup extension
  media: dvb-frontends: remove a clone of a kernel-doc markup at
    zd1301_demod.h
  media: v4l2-subdev.rst: get rid of a duplicatd kernel-doc markup
  media: cec-core.rst: fix warnings with Sphinx 3.0+
  media: v4l2-subdev.h: fix a kernel-doc markup
  media: hist-v4l2.rst: remove struct duplication
  media: hist-v4l2.rst: remove :c:`type` from structs and enums

 Documentation/admin-guide/media/ipu3.rst      |  38 +--
 .../driver-api/media/camera-sensor.rst        |   2 +-
 Documentation/driver-api/media/cec-core.rst   |  62 ++---
 .../driver-api/media/v4l2-subdev.rst          |   2 -
 .../userspace-api/media/glossary.rst          |  20 +-
 .../userspace-api/media/v4l/hist-v4l2.rst     | 239 ++++++++----------
 drivers/media/dvb-frontends/zd1301_demod.h    |   6 -
 include/media/v4l2-subdev.h                   |   2 +-
 8 files changed, 162 insertions(+), 209 deletions(-)

-- 
2.26.2


