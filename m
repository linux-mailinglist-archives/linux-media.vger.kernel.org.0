Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1967D5C13C
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 18:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbfGAQia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 12:38:30 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:51571 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbfGAQia (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 12:38:30 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 29C0060005;
        Mon,  1 Jul 2019 16:38:23 +0000 (UTC)
Message-ID: <e02bb1c0552601c75fd4971c7b56755fb8e7c241.camel@hadess.net>
Subject: Keymap with duplicate entries
From:   Bastien Nocera <hadess@hadess.net>
To:     aet@rasterburn.org
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>
Date:   Mon, 01 Jul 2019 18:38:23 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Aapo,

There seems to be a problem in  the keymap you provided for inclusion
in the kernel.

In drivers/media/usb/dvb-usb/m920x.c, 2 keys are triggered by the same
keycode:
 790 ↦       { 0x08, KEY_SUBTITLE },•
 794 ↦       { 0x08, KEY_VIDEO },↦   ↦       /* A/V */•

Could you please check what the correct values are for both of those
keys?

Thanks!

