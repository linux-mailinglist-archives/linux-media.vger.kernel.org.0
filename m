Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 537125C159
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 18:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfGAQmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 12:42:16 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58917 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbfGAQmQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 12:42:16 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2F7D51C0002;
        Mon,  1 Jul 2019 16:42:07 +0000 (UTC)
Message-ID: <373a2aeb31270899384be6336bdba0f9cc6e29be.camel@hadess.net>
Subject: Re: Keymap with duplicate entries
From:   Bastien Nocera <hadess@hadess.net>
To:     aet@rasterburn.org
Cc:     linux-media@vger.kernel.org, Sean Young <sean@mess.org>
Date:   Mon, 01 Jul 2019 18:42:06 +0200
In-Reply-To: <e02bb1c0552601c75fd4971c7b56755fb8e7c241.camel@hadess.net>
References: <e02bb1c0552601c75fd4971c7b56755fb8e7c241.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-07-01 at 18:38 +0200, Bastien Nocera wrote:
> Hey Aapo,
> 
> There seems to be a problem in  the keymap you provided for inclusion
> in the kernel.
> 
> In drivers/media/usb/dvb-usb/m920x.c, 2 keys are triggered by the
> same
> keycode:
>  790 ↦       { 0x08, KEY_SUBTITLE },•
>  794 ↦       { 0x08, KEY_VIDEO },↦   ↦       /* A/V */•
> 
> Could you please check what the correct values are for both of those
> keys?

Apparently Aapo's address bounced hard. If someone knows how to contact
them.

Cheers

