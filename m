Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE8DF337D09
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhCKS61 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:58:27 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58341 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229607AbhCKS6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:58:14 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KQVblQTce5C8yKQVelfDg4; Thu, 11 Mar 2021 19:58:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615489092; bh=rGQzsKKVQqP3T3ghfKUlCc12zOtlotJYl/Bz3P2nXAc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hQriWclP0oLvKGcdipJRXOGkr2UfEu4WRTvGcUsWpBbnreBhh+LPMgmMnfUKx9tPH
         K8zSoj00/Sq5B3r7myFwv1dt6gNVJPVClZhyrVnFmvSAK6GbSmTj9Axki8loQIUXjX
         lFH3o/s+dAcq1VxIG+UTMvnPJfLPg8oE02rOyjK2fmpvxGhA2/VQsctG2Irx8IGU+a
         WC701E4GJHTGlLDQpkfP5xBY9c21Uj1ck2i/VC4d3jmBm65/86LAUBOIWWn5H3KYud
         k2OxHdcreuGEdtXWJUb91GclZQvnAYPL7bSlgJwR/x3C9j41pgCleUyFM7zm1jeXxK
         vz5ACLy+3LPXw==
Subject: Re: linux-next: Tree for Mar 11 (media/cec/core/cec-notifier.o)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
References: <20210311161449.7f58e7a3@canb.auug.org.au>
 <b79f8dec-df6a-70d2-f8e8-807308a59a98@infradead.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <456e8b16-d303-fb29-5f64-e65dc3eb6387@xs4all.nl>
Date:   Thu, 11 Mar 2021 19:58:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b79f8dec-df6a-70d2-f8e8-807308a59a98@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfON67THe0ThtRxpDhOlcBrs1VMZIdothIIguZiFhSpe38fztNs1ryneiEaPK07bh+i3EANY7s7ZCrA1Yu51m2dcjdaHb+3eU+2SUF/IZbRNRjH/k5ig9
 MIbeiGAIXyDf98gVFVd76GOv20gm7RhNa39HGq/+cbQRiw9HAw6hsRTXz/zxBr15K4s/9f986Y/08TAQSWteAiQuBosH6365/Qv5b/ehwd8g1QD7q065bq1g
 DfKp/OGVddU3lteDsmTWu1aHq2A0GiZb0SYqHJcYj1NYSXvlc1DCyk/iAA9TA2mUc/hABHFZoguFD7meq1toxbS7UaXK6Oa4PWv57PC31y3G0uFWxrMNreVi
 8V9kAxUb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 18:37, Randy Dunlap wrote:
> On 3/10/21 9:14 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Warning: Some of the branches in linux-next are still based on v5.12-rc1,
>> so please be careful if you are trying to bisect a bug.
>>
>> News: if your -next included tree is based on Linus' tree tag
>> v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
>> consider rebasing it onto v5.12-rc2. Also, please check any branches
>> merged into your branch.
>>
>> Changes since 20210310:
>>
> 
> 
> on i386:
> 
> ld: drivers/media/cec/core/cec-notifier.o: in function `cec_notifier_parse_hdmi_phandle':
> cec-notifier.c:(.text+0xb3): undefined reference to `of_find_i2c_device_by_node'
> 
> Full randconfig file is  attached.
> 
> 

Fix for this is pending (waiting for Mauro to return from his vacation to
merge it).

Regards,

	Hans
