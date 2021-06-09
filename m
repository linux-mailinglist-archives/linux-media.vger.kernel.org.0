Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838143A0C93
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 08:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236785AbhFIGlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 02:41:08 -0400
Received: from smtprelay0019.hostedemail.com ([216.40.44.19]:40892 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230484AbhFIGlH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 02:41:07 -0400
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id E0DE7182CED28;
        Wed,  9 Jun 2021 06:39:12 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 094A520D75C;
        Wed,  9 Jun 2021 06:39:11 +0000 (UTC)
Message-ID: <9ebb46d4cb9f66c2bb3e6d1987d8e79fa20323f9.camel@perches.com>
Subject: Re: Re: [PATCH] drivers/media/usb/gspca: fix typo issues
From:   Joe Perches <joe@perches.com>
To:     herman yim <herman.yim88@gmail.com>,
        "yanshuaijun@yulong.com" <yanshuaijun@yulong.com>
Cc:     mchehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Date:   Tue, 08 Jun 2021 23:39:10 -0700
In-Reply-To: <CAP6HEvL-wCAfBJLBoJ2gaUBN0G-CWFb95e2nd6nwPNdwF7VaJQ@mail.gmail.com>
References: <20210609033245.3410-1-yanshuaijun@yulong.com>
         <601ccbd8b792abd0177475dd09fdd2d6c6f4a6af.camel@perches.com>
         <60c05921.1c69fb81.dbb59.4019SMTPIN_ADDED_BROKEN@mx.google.com>
         <CAP6HEvL-wCAfBJLBoJ2gaUBN0G-CWFb95e2nd6nwPNdwF7VaJQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.60
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 094A520D75C
X-Stat-Signature: 8s5kkpjp14sbpo9587ncxwj9wrczg6uo
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/lv6VH2VNvOHeZQWgaoCjS0n3Zjcgn6GU=
X-HE-Tag: 1623220751-774289
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-06-09 at 14:29 +0800, herman yim wrote:
> hi Joe,
>  many flicker written into fliker in this file, relate to variable name and
> function name.
>  change them together ? what is your suggestion ?

Leave it alone.  It's old and probably obsolete.


