Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE765C13A
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 18:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729314AbfGAQiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 12:38:25 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:36585 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbfGAQiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 12:38:25 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 20C481BF209;
        Mon,  1 Jul 2019 16:38:21 +0000 (UTC)
Message-ID: <e06c5349efde1706c307bfaf04ace99b3bbc0375.camel@hadess.net>
Subject: Keymap with duplicate entries
From:   Bastien Nocera <hadess@hadess.net>
To:     wangyounian@hisilicon.com
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>
Date:   Mon, 01 Jul 2019 18:38:20 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Younian,

There seems to be a problem in  the keymap you provided for inclusion
in the kernel.

In drivers/media/rc/keymaps/rc-hisi-poplar.c, 2 keys are triggered by
the same keycode:
 27 ↦       { 0x0000b2c5, KEY_DELETE},•
 34 ↦       { 0x0000b2c5, KEY_BACK},•

Could you please check what the correct values are for both of those
keys?

Thanks!

