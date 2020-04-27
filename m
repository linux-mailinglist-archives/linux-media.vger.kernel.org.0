Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CBA01B9F34
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 10:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgD0I7V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 04:59:21 -0400
Received: from www52.your-server.de ([213.133.104.52]:41864 "EHLO
        www52.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgD0I7U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 04:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=burnicki.net; s=default1902; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dUg/1Woj0VbpaLuKpFUtOp9sUCOVjh2mGpZreOqTTJo=; b=m+VOuC32wQSlqlZDmPs5evg28U
        IutvprSu9D7R6Xl+0VlMoB4q/Skk6j4KEt+3tm01yHfMH7klCTucQik5+ex2ZQfY/Ec9aUQmjAg0I
        LGQTK+6N46pavxLPzcYzncWRWp0X5dZtt4pPfFaiCzfnodUo/ZJcuTRomdEJPUnJh6Qo2bkNMzM7a
        cbc3KAhD5MMhAmoIykgI9Y9XbXMBPAeh66ykOi5WIcxWeUV2wx7+Ll9iCC998GIJlBR03233Mo11P
        qrQGpesSwHexz6BuV6WD+GkYUqiPB76lIxix78Xlev0yQcoONgXqh8hyT3Zga7/3+elUNjMgIQQfe
        buQOUkQg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www52.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89_1)
        (envelope-from <martin.burnicki@burnicki.net>)
        id 1jSzbi-0004wp-2W; Mon, 27 Apr 2020 10:59:18 +0200
Received: from [2a02:8108:98bf:e274:4d82:1183:1695:f1f5]
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <martin.burnicki@burnicki.net>)
        id 1jSzbh-000TIF-Qv; Mon, 27 Apr 2020 10:59:17 +0200
Subject: Re: HauppaugeTV-quadHD DVB-T mpeg risc op code error
To:     Sean Young <sean@mess.org>
Cc:     Rolf Pedersen <rolfpedersen@mindspring.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>
References: <0c0ab661-17bb-231a-7311-c35d8d0435c0@mindspring.com>
 <20200423153505.GA22057@gofer.mess.org>
 <686f60be-7a37-42ce-b4c0-b34cf54055e7@mindspring.com>
 <20200423155908.GA22613@gofer.mess.org>
 <bc0644cd-3438-6505-d438-8f3f71347ccb@mindspring.com>
 <20200423163559.GB23006@gofer.mess.org>
 <0cd2436c-0a39-0f85-929e-5d8f333b5027@burnicki.net>
 <20200425114147.GA3037@gofer.mess.org>
 <4aa38e2a-6b98-6530-69d9-d945a467bf0b@burnicki.net>
 <1a2d9e15-55e2-88a7-d197-208a8ce99218@burnicki.net>
 <20200427080751.GA5925@gofer.mess.org>
From:   Martin Burnicki <martin.burnicki@burnicki.net>
Autocrypt: addr=martin.burnicki@burnicki.net; keydata=
 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
 fPTIMcWxGmfGPw==
Message-ID: <e7d8aeb8-124a-f7b3-d469-4c47f182f067@burnicki.net>
Date:   Mon, 27 Apr 2020 10:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427080751.GA5925@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: mailout@burnicki.net
X-Virus-Scanned: Clear (ClamAV 0.102.2/25794/Sun Apr 26 14:01:10 2020)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sean Young wrote:
> Would you mind testing this patch please?

I'm going to try it this evening.

I'll have to find out how to do an out-of-tree build for a copy of the
cx module that includes the patch.

My own kernel driver is always and only built out-of-tree, but for the
cx driver I need to see which files I need to copy to a local directory,
and if there is anything else that needs to be done to build a copy of
it out-of-tree.

Martin
