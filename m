Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488BF2931A3
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 01:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgJSW7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 18:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgJSW7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 18:59:22 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5DCC0613CE;
        Mon, 19 Oct 2020 15:59:22 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q5so63952wmq.0;
        Mon, 19 Oct 2020 15:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=90onAW9hvF4OUiOOBS/SvN5SlPpbqJ6Cq5SI7GyfxG0=;
        b=C5yo6uRUjsjeOQwJWhWPjuoHPijZDe7AmfigkPBUc3ER2wHkrqMXftfnKan3seJNGU
         zu0vlafhvXVEhy8Pn5Ty85p9dKxUUFHYd7HjARhGZlxXbl1qK4abG3NiGa3HR7PbknzM
         U/bePgfyBX0ilM9k1V4yWmHXbatKD6EKHZBwyc8nyvnCOcC/PNd2qg8HDqbV818cS3ZC
         6Ie3MzEiM5rL2TUHvgs2mUGK3DXoGcZDpHQv3VSDn0ws5dcB7LtJLsH+A1PyAiuo9al+
         M83t718aXxYD+vntinlhaaEiiIt19gxfyVXnp9ZFKMgn3ube6SsqJQdrtZx+fZOseXGA
         fGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=90onAW9hvF4OUiOOBS/SvN5SlPpbqJ6Cq5SI7GyfxG0=;
        b=k1faRho/zi526rgBFGAjzbID5EfWvPSYa5ByOb8M/IpXgvG54q8GVWS5/39RyvP5YO
         FC8jVBE70gBouyXL6M3shwPfbbBN6vhxNn5sxR3KrwTc42D8m0odKgD6j76HFFTyf622
         UjTSS+HtE9lWihp4W9LNEN/EkQzDWHoE3YIFc1XKQg1t78UOjSO6xumy/m+kauvj3sw3
         nRVqdqHy0LXFwWiQ/xAR4EHby+NuDLrATPEpgD43+bJw0kScuEu0NUGNYECMmoQtNcXm
         ogVRMx2DklpLpdD5O+0oBfBH7FtubutWfOKUeNDvnbBDW1XoIhzItkTrkzCu+GimZxh8
         oN5Q==
X-Gm-Message-State: AOAM530tfgpmfkM5sUxnrQwb5c/aogZPOrKL0yXaCU5Qsje5IsRHKGJt
        o2N41SxUUjOD3wF5xtB5MXFOGi0hdE/Xdfdl
X-Google-Smtp-Source: ABdhPJx1b4qTPpZIyU9gWY+ghnmxogdKV0fgx572Oz03gfzbNZ8JKJiJ9M282oOvaJFUsr8hmBSSZA==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr99192wmk.43.1603148360421;
        Mon, 19 Oct 2020 15:59:20 -0700 (PDT)
Received: from djrscally-MIIX-510-12ISK.home ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id u20sm76505wmm.29.2020.10.19.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:59:19 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        andriy.shevchenko@linux.intel.com, sergey.senozhatsky@gmail.com,
        rostedt@goodmis.org, pmladek@suse.com, mchehab@kernel.org,
        tian.shu.qiu@intel.com, bingbu.cao@intel.com,
        sakari.ailus@linux.intel.com, yong.zhi@intel.com,
        rafael@kernel.org, gregkh@linuxfoundation.org, kitakar@gmail.com,
        dan.carpenter@oracle.org
Subject: [RFC PATCH v3 0/9] Add functionality to ipu3-cio2 driver allowing software_node connections to sensors on platforms designed for Windows
Date:   Mon, 19 Oct 2020 23:58:54 +0100
Message-Id: <20201019225903.14276-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

This series adds support to the ipu3-cio2 driver for fwnode connections
between cio2 and sensors to be defined via software_nodes. The final patch
in the series deals wholly with those changes - the preceding patches are
either supporting changes to accommodate that or incidental fixes along
the way:

1/9 adds a function to drivers/base/swnode.c unwinding arrays of software
nodes in reverse order

2/9 uses that function in lib/test_printf.c

3/9 fixes what seems to me to be a bug in the existing swnode.c code in
that software_node_get_next_child() does not increase the refcount of the
returned node (in contrast to, for example, of_get_next_child_node() which
does increase the count)

4/9 adds the fwnode_graph*() family of functions to the software_node
implementation

5/9 adds a T: entry to MAINTAINERS for the ipu3-cio2 driver

6/9 renames the ipu3-cio2.c file to ipu3-cio2-main.c and fixes Makefile
to accommodate that change

7/9 alters the ipu3-cio2 driver to check if the pci_dev's fwnode is a
software_node and pass flags to fwnode_graph_get_endpoint_by_id() if so

8/9 alters match_fwnode() in v4l2-async.c to additionally try to match on
a fwnode_handle's secondary if the primary doesn't match

9/9 alters the ipu3-cio2 driver to do the actual building of software_node
connections between the sensor devices and the cio2 device.

This is still not ready for integration - hence the RFC label - as there
is ongoing work to extend the ipu3-cio2 driver further to parse ACPI
to discover resources such as regulators and GPIOs that are defined there
in unusual ways and map them to the sensor devices so that their drivers
can consume them transparently through the usual frameworks. Given this
has changed quite extensively from v2 though, I wanted to submit it for
feedback at this point in case it needs further large scale change.

Thanks
Dan

Daniel Scally (8):
  software_node: Add helper function to unregister arrays of
    software_nodes ordered parent to child
  lib/test_printf.c: Use helper function to unwind array of
    software_nodes
  software_node: Fix failure to hold refcount in
    software_node_get_next_child
  ipu3-cio2: Add T: entry to MAINTAINERS
  ipu3-cio2: Rename ipu3-cio2.c to allow module to be built from
    multiple sources files retaining ipu3-cio2 name
  ipu3-cio2: Check if pci_dev->dev's fwnode is a software_node in
    cio2_parse_firmware() and set FWNODE_GRAPH_DEVICE_DISABLED if so
  media: v4l2-core: v4l2-async: Check possible match in match_fwnode
    based on sd->fwnode->secondary
  ipu3-cio2: Add functionality allowing software_node connections to
    sensors on platforms designed for Windows

Heikki Krogerus (1):
  software_node: Add support for fwnode_graph*() family of functions

 MAINTAINERS                                   |   2 +
 drivers/base/swnode.c                         | 143 +++++++-
 drivers/media/pci/intel/ipu3/Kconfig          |  18 +
 drivers/media/pci/intel/ipu3/Makefile         |   3 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c    | 327 ++++++++++++++++++
 drivers/media/pci/intel/ipu3/cio2-bridge.h    |  94 +++++
 .../ipu3/{ipu3-cio2.c => ipu3-cio2-main.c}    |  30 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   9 +
 drivers/media/v4l2-core/v4l2-async.c          |   8 +
 include/linux/property.h                      |   1 +
 lib/test_printf.c                             |   4 +-
 11 files changed, 632 insertions(+), 7 deletions(-)
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
 create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (98%)

-- 
2.17.1

