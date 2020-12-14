Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9249B2D994C
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 14:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgLNN4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 08:56:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:48678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbgLNN4Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 08:56:24 -0500
Date:   Mon, 14 Dec 2020 14:56:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607954144;
        bh=KoUkRaTRm8OzevwgD6ukwjI1VQVT0ST0XiqvYr+hzZU=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=iDzpd1WNErkCXv/XA44/VzLdrHA0H9Jytq2iHRauco1tPSzwz/luGvCpKu76cLAAn
         4basZYhXgk1mK4Sno9gBNJKCVcI66EYbIz4bN2is9hCT9EMTP/LTaV5+UnTmc2NXfN
         SIMBujbM2KgKe1arf7LsJQa7qMgLsUzq2B3BNUfA=
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Philipp Gerlesberger' <Philipp.Gerlesberger@fau.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ij72uhux@stud.informatik.uni-erlangen.de" 
        <ij72uhux@stud.informatik.uni-erlangen.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@i4.cs.fau.de" <linux-kernel@i4.cs.fau.de>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: Re: [PATCH v2 09/12] media: atomisp: Fix PARENTHESIS_ALIGNMENT
Message-ID: <X9dvIVc5evB8cfEr@kroah.com>
References: <20201214110358.7102-10-Philipp.Gerlesberger@fau.de>
 <61d5f8315efc42238a5516b1dc496760@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61d5f8315efc42238a5516b1dc496760@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 14, 2020 at 11:49:56AM +0000, David Laight wrote:
> From: Philipp Gerlesberger
> > Sent: 14 December 2020 11:04
> > 
> > You can sum up the two lines, because the maximum line length of
> > 100 columns is not exceeded.
> 
> IIRC the 80 column limit is preferred.

Not anymore, checkpatch has changed.
