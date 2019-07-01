Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5395C153
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 18:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbfGAQkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 12:40:55 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42621 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727419AbfGAQky (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 12:40:54 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4063C1C0002;
        Mon,  1 Jul 2019 16:40:53 +0000 (UTC)
Message-ID: <1dc6a433435719074a3c72a45fa68bbda5096edb.camel@hadess.net>
Subject: Re: [PATCH v2] keytable: Add keymap test
From:   Bastien Nocera <hadess@hadess.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Mon, 01 Jul 2019 18:40:52 +0200
In-Reply-To: <3bbb2edc0b34a029c7514fdf67af70d5e7e514f3.camel@hadess.net>
References: <b6ffea1984f05adec9f52cd60902a95c82bf8666.camel@hadess.net>
         <20190627193348.d53sbpys32i7qyi3@gofer.mess.org>
         <3bbb2edc0b34a029c7514fdf67af70d5e7e514f3.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-07-01 at 16:27 +0200, Bastien Nocera wrote:
> > That would be great. They have to be patched in the kernel tree,
> > they
> > are generated from there.
> 
> It's customary to put a comment at the top of generated files
> indicating that they shouldn't be modified and list the name and
> version of the tools used to generate that file.
> 
> So, what's the name of the tool used, and where does it live? :)

Apparently it's called gen_keytables.pl, and I've sent a couple of
patches to it because it didn't ignore comments, and then sent a couple
of mails to broken definitions in the kernel.

Once the 3 broken definitions in the kernel are fixed, fixing all the
keymaps in v4l-utils will be as easy as regenerating the keymaps, and
I'll send the updated patch for the "check" target.

Don't forget to remove the files before generating them again, a number
of keymaps were removed from the upstream kernel.

Cheers

