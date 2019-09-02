Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE973A56DE
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 15:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbfIBNAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 09:00:45 -0400
Received: from gofer.mess.org ([88.97.38.141]:37589 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729453AbfIBNAp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 09:00:45 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8C2F7609BF; Mon,  2 Sep 2019 14:00:44 +0100 (BST)
Date:   Mon, 2 Sep 2019 14:00:44 +0100
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: ir-keytable compiler warnings
Message-ID: <20190902130044.ztxusc62oqnbipip@gofer.mess.org>
References: <03899f78-498c-cd37-ac0d-7b3d34852f3a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03899f78-498c-cd37-ac0d-7b3d34852f3a@xs4all.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Sep 02, 2019 at 02:42:45PM +0200, Hans Verkuil wrote:
> I get these compiler warnings:
> 
>   CC       keymap.o
> keytable.c:1832:76: warning: ‘struct toml_table_t’ declared inside parameter list will not be visible outside of this definition or
> declaration
>  1832 | static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
>       |                                                                            ^~~~~~~~~~~~
> keytable.c: In function ‘main’:
> keytable.c:2108:42: warning: passing argument 3 of ‘attach_bpf’ from incompatible pointer type [-Wincompatible-pointer-types]
> 
>  2108 |     attach_bpf(rc_dev.lirc_name, fname, b->param);
>       |                                         ~^~~~~~~
>       |                                          |
>       |                                          struct protocol_param *
> keytable.c:1832:90: note: expected ‘struct toml_table_t *’ but argument is of type ‘struct protocol_param *’
>  1832 | static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
>       |                                                                     ~~~~~~~~~~~~~~~~~~~~~^~~~
>   CCLD     ir-keytable
> 
> It's with gcc 9.2.
> 
> Can you take a look?

I've pushed a fix. I had not tested building without the BPF enabled (when
clang and elfutils-libelf-devel are not installed on Fedora).


Sean
