Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65E22FCE77
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387723AbhATKmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:38 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41371 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732054AbhATKRZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:17:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2AXUlJQksftvz2AXXl8rwF; Wed, 20 Jan 2021 11:16:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611137799; bh=kh0RCFRcSZLc3sZQmxYzo1ISwv4q2QvPNy6Y+CZzJ90=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=eYRW1BhXLNcDoJ5xEaZOTmdxXqUNyZoQ4yIHVk/Uj7/+QdL4/U3e1o+vukttlsatr
         pSdFZ9J8e6yawwMDeqISxKOqCfXieKphidpyi/dh97H0nPQ0vrH1aQ2GUPJUDLqZ8J
         fSw1VKD1Gd2LgiRNYLjJH1bJa3yHT2PYdt0TFeARwLySvVzLdY91qEjBaT8xEO96zb
         f6LAln2Sa5pcZ/y21+64DEqPieFHiVKV/kAybvn1XKatATaoPLEb6eDdRyG3+l5smE
         aqOkiYvG8M5/92Y57eBHs2tHXClBGxDZnfAwaXqOF9JYlfFnKI8V3kBl5Qut8wSmOL
         w7Acit+0bUQnw==
Subject: Re: Failing V4l2-compliance test with a sensor driver
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
References: <20210115115324.glhnixqafh2jakw4@basti-TUXEDO-Book-XA1510>
 <1821bd61-818f-5e1b-156a-3c72b2bca800@xs4all.nl>
 <20210115183449.xrkl6u2sk2su7zgp@basti-TUXEDO-Book-XA1510>
 <b4a9a516-88bb-c278-0088-d652ec588556@collabora.com>
 <20210118071500.x7e2pdszql44ncba@basti-TUXEDO-Book-XA1510>
 <bea28ee9-0cb4-4849-5e73-96e6ef1f945a@xs4all.nl>
 <20210118180306.aai3zfo5xpcr3y32@basti-TUXEDO-Book-XA1510>
 <cb50dc5e-33c6-d002-a31a-af91bbec6d6e@collabora.com>
 <7b77875c-5339-1c90-a6d8-304d56097861@xs4all.nl>
 <20210119191634.nolxxbisfdgm4gj7@basti-TUXEDO-Book-XA1510>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <06878d92-70c2-ca24-b6c7-032becb0a0f6@xs4all.nl>
Date:   Wed, 20 Jan 2021 11:16:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119191634.nolxxbisfdgm4gj7@basti-TUXEDO-Book-XA1510>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKGvuGZIo7TA6IY8orkxzyFbjNXoIWcsTdgBMRT9T1/ktQvJpiGe+lTqSqqJRJt0MU4mWw9m/hNto8v5SB/Ih7xGgdkOAQLLbwdCjqBaksRyszKd2kJn
 eMZqaD7+ZZSpYCIme3BggNeQvF83nmN/ptjDtG/XcRQn0SADcgh8sMZCh2hlfqTDq+S0wGQv/8KPwi0NNQSTMh29nTb2BfNXHaX048JBpmqd89tX/+4nnp6U
 rslpbC71SJDHshlYB17jaZT8/HR2Itzxl06OaxJUPJbsNHs0AcZ7Hu7VEOnJ/ZnL8TKtL7Zmx/QPoLLCStG/pw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/01/2021 20:16, Sebastian Fricke wrote:

<snip>

> I gathered all the information you require within this paste-bin:
> https://paste.debian.net/1181807/

Hmm, the problem is that v4l2-compliance can't find the media controller
that the subdev is part of.

What is the output of:

ls -l /sys/class/video4linux/v4l-subdev3

There should be a 'device' link listed.

Please also show the output of:

ls -l /sys/class/video4linux/v4l-subdev3/device/

If I compare this with the vimc test driver (using v4l-subdev0) there is a
media0 directory in /sys/class/video4linux/v4l-subdev0/device/ which is
the media controller that the subdev is associated with.

Regards,

	Hans
