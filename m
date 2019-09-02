Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17BF9A5677
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 14:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbfIBMmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 08:42:52 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:33815 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729844AbfIBMmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 08:42:52 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4lfSidvqizaKO4lfViXkdV; Mon, 02 Sep 2019 14:42:50 +0200
To:     Sean Young <sean@mess.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: ir-keytable compiler warnings
Message-ID: <03899f78-498c-cd37-ac0d-7b3d34852f3a@xs4all.nl>
Date:   Mon, 2 Sep 2019 14:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFJw9Fxsosfz7/PtmPLmVgrmj5+5hSazBuRsX233gngKaObwLLGllNV0ZTC0wBmCEuBWqIAVL0tWpz9aN1Vlh3d+qezrw4qodJwmDRoyUYb+8BxSetCz
 lEgIhuWuZtbr+yv6+dgUSMAQkdOrEWJgr5jtGtYSshoBURzf6ZrEDEY0GfMPH/jy6P0pq3zxTcGk3XTx15cVFxfxa89bhSjSF/k=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

I get these compiler warnings:

  CC       keymap.o
keytable.c:1832:76: warning: ‘struct toml_table_t’ declared inside parameter list will not be visible outside of this definition or
declaration
 1832 | static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
      |                                                                            ^~~~~~~~~~~~
keytable.c: In function ‘main’:
keytable.c:2108:42: warning: passing argument 3 of ‘attach_bpf’ from incompatible pointer type [-Wincompatible-pointer-types]

 2108 |     attach_bpf(rc_dev.lirc_name, fname, b->param);
      |                                         ~^~~~~~~
      |                                          |
      |                                          struct protocol_param *
keytable.c:1832:90: note: expected ‘struct toml_table_t *’ but argument is of type ‘struct protocol_param *’
 1832 | static void attach_bpf(const char *lirc_name, const char *bpf_prog, struct toml_table_t *toml)
      |                                                                     ~~~~~~~~~~~~~~~~~~~~~^~~~
  CCLD     ir-keytable

It's with gcc 9.2.

Can you take a look?

Regards,

	Hans
