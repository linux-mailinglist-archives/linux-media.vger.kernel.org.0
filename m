Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93688EEF3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 17:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732132AbfHOPAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 11:00:10 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35723 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbfHOPAJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 11:00:09 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so1515973wmg.0;
        Thu, 15 Aug 2019 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AT6SBdTWCfB14GGqz8HhPxiAnTof/RZXopdQCtNlMj0=;
        b=ApNJyRL/CtWMWEcvsfuxy75j5hDH3+3l3U/kUEtfatsU2jCDnFU0JrjJhQqztHEyVX
         ZBf+AF8sureX3Rn0e6llWGEb5Nd6DZ1S5rN3LdSFztPdlulQkx0Lvr4xt/On6LZN60g/
         tiBWi6Vs3fymYZyyA76bcOH1RIdfjS+S0VceNFjXR0FIMDgOeqH5SBRuedUGtxsYFdmI
         lZqn5nWsMkiBDsaz072rwM1j3ceP7ouFgT6SuUwUEWhLSFwaeUtxW2E/lUuVTkk1TD27
         OAJuq6bM5OmdSyfB94TnVHqniYn3/IcSH9tUobrC7q/G6555+iHmDszSluR5cddEmtpa
         Pg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AT6SBdTWCfB14GGqz8HhPxiAnTof/RZXopdQCtNlMj0=;
        b=TU2cVBghejT3dqzWFQ/ZqYFumypDked6DXqbj6sIhui3ErewqQEejGFiml18h4AFob
         1DNXXHBhgCiftOTFiz1cRRwVAEey77si0gNkVdRg7OAlJtp32klXjldcvt9utuZva43W
         JFwMYa4d4mq2R0Yevfa/oc8GLlMruPHC8moOYbLi4n2Vi711jMkjCGnNfwn5mRNVkT6u
         SvI3/2q2WO9tUzWKtkdQKdENaZ0csFd9+pcMr1n4g6/grJbu6lXJ/iUKdW3x7t4o/tU9
         H9HtMrajsBV8Od3TDZeUWDgyRoVLrhx0hfP9iZBzSg9cp47d2b3b6/0ol/vB5zCmQSnQ
         cdXg==
X-Gm-Message-State: APjAAAXo0cGdeVAidiAT7kqBtygL6LadVSlHmeHhRu4jv4wR6t8mqJyT
        FuhyRfrqMFMbIKwFeG2voYc=
X-Google-Smtp-Source: APXvYqwpWvZ1WlKqFH37YuDJYaoQiQ/o/sdZdjkNO2n8K67kXq9JE4ht1IQu4MKhy1WxTgZ5nbaVRw==
X-Received: by 2002:a1c:ed06:: with SMTP id l6mr3077053wmh.128.1565881206601;
        Thu, 15 Aug 2019 08:00:06 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
        by smtp.gmail.com with ESMTPSA id e4sm5041054wrh.39.2019.08.15.08.00.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 15 Aug 2019 08:00:05 -0700 (PDT)
From:   Christian Hewitt <christianshewitt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Sean Young <sean@mess.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/7] media: rc: Add keymaps for common STB/SBC devices
Date:   Thu, 15 Aug 2019 18:59:10 +0400
Message-Id: <1565881157-14644-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series submits keymaps for a number of Android STB/SBC devices that
are regularly used with the Kodi mediacentre distro LibreELEC.

Keymaps list buttons in rows, top-down, to aid visual comparison against
devices. It's common for users of other no-name Android boxes to try a
number of keymaps trying to find one that works and this reduces some of
the guesswork. If the assigned key differs from the marked key, e.g.
where Android 'mouse' buttons have been given a more useful purpose, the
keymap has been commented.

Christian Hewitt (7):
  media: rc: add keymap for Amediatech X96-MAX remote
  media: rc: add keymap for Khadas VIM/EDGE remote
  media: rc: add keymap for Tanix TX3 mini remote
  media: rc: add keymap for Tanix TX5 max remote
  media: rc: add keymap for WeTek Hub remote
  media: rc: add keymap for WeTeK Play 2 remote
  media: rc: add keymap for HardKernel ODROID remote

 drivers/media/rc/keymaps/Makefile           |  7 +++
 drivers/media/rc/keymaps/rc-khadas.c        | 56 +++++++++++++++++
 drivers/media/rc/keymaps/rc-odroid.c        | 51 ++++++++++++++++
 drivers/media/rc/keymaps/rc-tanix-tx3mini.c | 79 ++++++++++++++++++++++++
 drivers/media/rc/keymaps/rc-tanix-tx5max.c  | 71 +++++++++++++++++++++
 drivers/media/rc/keymaps/rc-wetek-hub.c     | 55 +++++++++++++++++
 drivers/media/rc/keymaps/rc-wetek-play2.c   | 95 +++++++++++++++++++++++++++++
 drivers/media/rc/keymaps/rc-x96max.c        | 85 ++++++++++++++++++++++++++
 include/media/rc-map.h                      |  7 +++
 9 files changed, 506 insertions(+)
 create mode 100644 drivers/media/rc/keymaps/rc-khadas.c
 create mode 100644 drivers/media/rc/keymaps/rc-odroid.c
 create mode 100644 drivers/media/rc/keymaps/rc-tanix-tx3mini.c
 create mode 100644 drivers/media/rc/keymaps/rc-tanix-tx5max.c
 create mode 100644 drivers/media/rc/keymaps/rc-wetek-hub.c
 create mode 100644 drivers/media/rc/keymaps/rc-wetek-play2.c
 create mode 100644 drivers/media/rc/keymaps/rc-x96max.c

-- 
2.7.4

