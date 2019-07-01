Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083C65C13B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 18:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbfGAQi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 12:38:28 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49625 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbfGAQi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 12:38:28 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EE02B1BF20D;
        Mon,  1 Jul 2019 16:38:26 +0000 (UTC)
Message-ID: <7d2bf66655bfdaeeea45ef0878e7920b485bb120.camel@hadess.net>
Subject: Keymap with duplicate entries
From:   Bastien Nocera <hadess@hadess.net>
To:     tvboxspy@gmail.com
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>
Date:   Mon, 01 Jul 2019 18:38:26 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Malcolm,

There seems to be a problem in  the keymap you provided for inclusion
in the kernel.

In media/rc/keymaps/rc-it913x-v2.c, 2 keys are triggered by the same
keycode:
 53 ↦       { 0x866b18, KEY_VOLUMEDOWN },•
 55 ↦       { 0x866b18, KEY_CHANNELDOWN },•

Could you please check what the correct values are for both of those
keys?

Thanks!

