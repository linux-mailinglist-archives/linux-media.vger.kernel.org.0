Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B5614C3B2
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 00:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgA1XrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 18:47:20 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60524 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgA1XrU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 18:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=GGitX/6T7DvWw6ZAOTOZTxt7aI3kom8E49BexV2r+4Q=; b=iMV6By1yTI74CLt5CC6uBT+pA
        kVTEYBVaRke5hkVmIXKtsyb920UN3edsJSeJQk8XvZWaavFQd3EUiFaT5LMLObJaJ2ZNSeqoH0r8E
        WmtrFRPrabSX+RhNHPYlYhq3ZasLFXtJs+mC0voIrp7JkH/Poynw/aiE2Bd7oq612/woM+/pkvkQA
        Z+o99/uUCab5+ZqJcQBjsGPATssom6QuJOpNouxnTnK+z/kivkkIs5Jh9H4j+dfRcbgIAqT4lWhbS
        DvAN/YD3i9zdrtKjjuPB7FEAbc252Ps3XqY6BASKur7r3Lo3xuWEpS3jkoxy4hbrT1vpXJ2fwLkDc
        zO9B2VKaA==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwaZj-0003QR-7q; Tue, 28 Jan 2020 23:47:19 +0000
Subject: Re: [PATCH 1/2] docs: usb: remove some broken references
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
References: <00008303fde6b4e06d027d3b76ae7032614a7030.1580193653.git.mchehab+huawei@kernel.org>
 <20200128134228.3c6f56b9@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <244ed240-46aa-aa73-6f89-df7944d42cbf@infradead.org>
Date:   Tue, 28 Jan 2020 15:47:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128134228.3c6f56b9@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/28/20 12:42 PM, Jonathan Corbet wrote:
> On Tue, 28 Jan 2020 07:41:00 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
>> It seems that some files were removed from USB documentation.
>>
>> Update the links accordingly.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> Applied, thanks.
> 
> jon

This warning has been around for quite awhile now:

lnx-55/Documentation/usb/text_files.rst:22: WARNING: Include file u'lnx/lnx-55/Documentation/usb/wusb-cbaf' not found or reading it failed

Looks like it has been moved to drivers/staging/wusbcore/Documentation/wusb-cbaf.

-- 
~Randy

