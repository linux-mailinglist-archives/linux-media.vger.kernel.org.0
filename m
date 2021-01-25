Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED56130485D
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388657AbhAZFpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:23 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:57952 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728976AbhAYNjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:39:20 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id CC3AC3BA51F
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 13:34:47 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 219DF4000C;
        Mon, 25 Jan 2021 13:33:20 +0000 (UTC)
Message-ID: <7fdd2459bd00c631c976cd1414842eae3f89417b.camel@hadess.net>
Subject: Firefly X10 mouse mode?
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     Anssi Hannula <anssi.hannula@iki.fi>
Date:   Mon, 25 Jan 2021 14:33:20 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey,

I have a SnapStream Firefly[1] X10 remote and couldn't figure out how
to make the "mouse" buttons work the same way it does using the
original software.

Here's an excerpt from the manual:
"
Your Firefly Remote includes Mouse Mode which allows you to
navigate anywhere on your screen just as you would with a
mouse. Together these buttons simulate your mouse and
increase your control of software applications using Firefly.
1. Launch the Beyond Media Basic Main Menu by pressing the
Firefly Button.
2. To enable Mouse Mode, press the Mouse button. In the
lower right corner of your screen, you will see an image of a
mouse to indicate you are now in Mouse Mode.
3. Locate the cursor on your screen. Press the Navigation
Buttons to move the cursor left, right, up or down.
4. Just below the Navigation Buttons, locate the Menu and Exit
buttons. As the small image above each of these buttons
indicates, they provide the left and right-click functions on
your mouse. The Info and Option buttons just above the
Navigation Buttons allows you to cycle through
applications that are currently open on your PC.
When you're finished using Mouse Mode, press the Mouse
button again to disable Mouse Mode.
"

I don't have a use for the remote, so I'm happy to send it to a
developer who would be able to fix this problem upstream.

Cheers

[1]: http://www.remotecentral.com/firefly/photo01.htm

