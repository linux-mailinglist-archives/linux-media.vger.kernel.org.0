Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E6C354C33
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 07:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243783AbhDFFRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 01:17:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:59022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243725AbhDFFRc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 01:17:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04A7B613A3;
        Tue,  6 Apr 2021 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617686245;
        bh=+znzAHRb+50H/RORNjCd4hc3uJ2CmZGOiy6dCAaomfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s/yFExXqWE9W1zGxI3GwhSnrxA2GOkC1X0Bb9CqUZ+8WnioY1wf1vohouyft2Bqyh
         466TCRsW4tXnXQRLw5LcmsBL/KRAJfo9javWyUkpS2KAVDH6GaLtT7jQzUp4NWJBgN
         ewps1Wi/KOHhlgAqgk7OP3kagmOQAW0z8W6Hds5w=
Date:   Tue, 6 Apr 2021 07:17:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Villasana =?iso-8859-1?Q?Jim=E9nez?= 
        <davidvillasana14@gmail.com>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re:
Message-ID: <YGvu4x6+argAcs4z@kroah.com>
References: <YGt9UNqRnOx2j+4M@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YGt9UNqRnOx2j+4M@fedora>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 05, 2021 at 04:12:48PM -0500, David Villasana Jiménez wrote:
> linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
> Bcc: 
> Subject: [PATCH] staging: media: atomisp: i2c: Fix alignment to match open
>  parenthesis
> Reply-To: 

Something went wrong with your email again :(
