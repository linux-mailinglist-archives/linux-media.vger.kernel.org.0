Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B919302981
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 19:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbhAYSDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 13:03:31 -0500
Received: from gofer.mess.org ([88.97.38.141]:52921 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731260AbhAYSDF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 13:03:05 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5610DC6398; Mon, 25 Jan 2021 18:02:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1611597743; bh=/fQ+BLOlGgexGe5lNYYpMyef2IJr/D/SvmMNoBjirtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qcDJ+a5iilPdFK9duPJr4FvxUHD+NT5LuW0r8uq77r1MYcnOavID6KyrwalovGfLy
         K5gug5fFfcsLeXfRBRlhr7j3LLSzjFHbkxkNxidQpEIxNIp5xqZ5D19dlCwT8qeL/1
         1wdxEEYAZhA5OASVCJUzVfLemN23cpaRbpGW83ZtIsdznXqML58jWDkWqMhoFHvLG0
         p4PL8WdUQcEcirT20OKa5HSuK03+8tDuPTQt6mlFLtiMVBbgHotoadu1/UqHCCf38+
         9/CDSIC3txj9K2Om3jx7CXOMLRj/tUoN+tiIlElZf+CDvUQJS8eBS98dsgniIjWogb
         rd36ZRlKks6EA==
Date:   Mon, 25 Jan 2021 18:02:23 +0000
From:   Sean Young <sean@mess.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] keytable: Add Dell RC 260 keymap
Message-ID: <20210125180222.GA16232@gofer.mess.org>
References: <20210125173531.644122-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125173531.644122-1-hadess@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bastien,

On Mon, Jan 25, 2021 at 06:35:30PM +0100, Bastien Nocera wrote:
> Apparently used in the Dell Inspiron Zino HD 410 desktop:
> http://web.archive.org/web/20180805000711/http://www.dell.com/ba/p/desktops/inspiron-zino-hd-410/pd
> 
> Manual linked in the remote definition itself.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  utils/keytable/rc_keymaps/dell_rc260.toml | 49 +++++++++++++++++++++++

These files are generated from the keymaps in the kernel tree. Those can
be found in drivers/media/rc/keymaps/rc-*.c.

A patch to create the keymap in the kernel tree would be better. This is
also true for your other patch for the Xbox 360 rc keymap.

The script which generates the toml file is in utils/keytable/gen_keytables.pl
in the v4l-utils repo.

Some keymaps are v4l-utils only; this is true for keymaps which can't be
loaded from the kernel (ones that use BPF decoders).

>  1 file changed, 49 insertions(+)
>  create mode 100644 utils/keytable/rc_keymaps/dell_rc260.toml
> 
> diff --git a/utils/keytable/rc_keymaps/dell_rc260.toml b/utils/keytable/rc_keymaps/dell_rc260.toml
> new file mode 100644
> index 00000000..603d3a18
> --- /dev/null
> +++ b/utils/keytable/rc_keymaps/dell_rc260.toml
> @@ -0,0 +1,49 @@
> +[[protocols]]
> +name = "dell_rc260"
> +protocol = "rc6"
> +variant = "rc6_mce"

The variant is rc-6-6a-32a for these scancodes.

> +# https://archive.org/details/manualsonline-id-b1c9aa7c-e060-40b0-816a-918536a02fac/
> +[protocols.scancodes]
> +0x803404a9 = "KEY_HOMEPAGE"
> +0x8034040c = "KEY_POWER"
> +0x80340437 = "KEY_RECORD"
> +0x80340430 = "KEY_PAUSE"
> +0x80340431 = "KEY_STOP"
> +0x80340429 = "KEY_REWIND"
> +0x8034042c = "KEY_PLAY"
> +0x80340428 = "KEY_FASTFORWARD"
> +0x80340421 = "KEY_PREVIOUS"
> +0x80340420 = "KEY_NEXT"
> +0x80340483 = "KEY_BACK"
> +0x803404cb = "KEY_INFO"
> +0x8034045d = "KEY_LEFTMETA"
> +0x80340458 = "KEY_UP"
> +0x8034045a = "KEY_LEFT"
> +0x8034045b = "KEY_RIGHT"
> +0x80340459 = "KEY_DOWN"
> +0x8034045c = "KEY_OK"
> +0x80340410 = "KEY_VOLUMEUP"
> +0x80340411 = "KEY_VOLUMEDOWN"
> +0x8034041e = "KEY_CHANNELUP"
> +0x8034041f = "KEY_CHANNELDOWN"
> +0x8034040d = "KEY_MUTE"
> +0x80340401 = "KEY_NUMERIC_1"
> +0x80340402 = "KEY_NUMERIC_2"
> +0x80340403 = "KEY_NUMERIC_3"
> +0x80340404 = "KEY_NUMERIC_4"
> +0x80340405 = "KEY_NUMERIC_5"
> +0x80340406 = "KEY_NUMERIC_6"
> +0x80340407 = "KEY_NUMERIC_7"
> +0x80340408 = "KEY_NUMERIC_8"
> +0x80340409 = "KEY_NUMERIC_9"
> +0x80340400 = "KEY_NUMERIC_0"
> +0x80340433 = "KEY_NUMERIC_STAR"
> +0x80340432 = "KEY_NUMERIC_POUND"
> +0x8034043a = "KEY_CLEAR"
> +# Teletext key doesn't light the IR LED
> +0x8034043e = "KEY_EPG"
> +0x80340434 = "KEY_ENTER" # labelled Enter
> +0x8034046d = "KEY_RED"
> +0x8034046e = "KEY_GREEN"
> +0x8034046f = "KEY_YELLOW"
> +0x80340470 = "KEY_BLUE"
> -- 
> 2.29.2
