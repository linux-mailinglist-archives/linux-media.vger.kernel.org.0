Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8664AB5BE
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 12:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbfIFKX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 06:23:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34582 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728628AbfIFKX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 06:23:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id z21so4592714lfe.1
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 03:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f8H5bIBdKoS1HrUh2drI7VlolibnVhaDOfnjnsW1YW0=;
        b=vOks+y2m8igch8MnJvoqaEzNWPHFZVdoyWn47m6oGTq4rIXHPGpkJmSaXTh6HH9+I7
         2ckYdkglCXXw3MK+ZyJYVYgtcV4ZpCmVzBWz4HCFhXCmVsmbo7mrVTSiRzNthXFtlOp1
         sIYkBtKvrcK2gkkU/vfW3/0p6S4UItFXVsjXr2pG3OWiT1nuV7yi9+zku4LuwAt0TjBr
         vscUyc4jsaSXoLvDWBkED3O1hkSdurZkw36E+5HnrhZ2KttxSTTGABKeQdAlYPXGZ6Ot
         1M6JlLvCnPK57y0zdvdOmsw/bxHX0MbNAS7+HgzhPf7wptgIcJgzeezIzRIvIvNG1bRf
         XzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f8H5bIBdKoS1HrUh2drI7VlolibnVhaDOfnjnsW1YW0=;
        b=kAvB4N/qDoTnYejMhaEwmZPR5zGOuZg1s6JNShYVYqXSqeng/mW+zhemWFTKysbgVv
         tRPsJp01kBs/yG6kGTMmrJ3MT5foMGIjnB946qsNlbReElAgSMNuXs+hdmn35jQH7iXP
         K9Gr7SNjc3Z+D79y1FIHtWihp8sm5LXemRaHvPjVYDfidd37tCSbqUl35uZf7yGVcsvF
         v72Dizdk960RpCw12wzuaoYHSGThAwTd/UYEUark0bxYoq7ZNcnmNcyr0OF1JWH388jI
         Mqza+os06gbVI8WI4cANWEKx8hOUY325Wt1OyUw2LEa5nNATBcl4d6AGmOolNtvsXnHh
         O9kA==
X-Gm-Message-State: APjAAAUw199mKFLTmpOjHThVPq7EWD3y57AL7QQ35Jc9eq2ikvb7YjWC
        GJOHthJioQVuIr4lToSno0AHvwHrKco/Zw==
X-Google-Smtp-Source: APXvYqxOyKnZcINnzuSv7Y7eZ+8vhh7r6vOzEbyIgjQQLS8a7Ndo2BaJ+llUi4e0/FOkOhNLFKOxtA==
X-Received: by 2002:ac2:5101:: with SMTP id q1mr5681233lfb.13.1567765436772;
        Fri, 06 Sep 2019 03:23:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:467:6174:2510:8c9c:d80b:bedb? ([2a00:1fa0:467:6174:2510:8c9c:d80b:bedb])
        by smtp.gmail.com with ESMTPSA id t82sm1038256lff.58.2019.09.06.03.23.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 03:23:56 -0700 (PDT)
Subject: Re: [PATCH 2/2] rcar-vin: Add support for V4L2_FIELD_SEQ_{TB,BT}
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190905214915.13919-1-niklas.soderlund+renesas@ragnatech.se>
 <20190905214915.13919-3-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <daa66ff1-1130-c8b6-5f42-bc9449a3642b@cogentembedded.com>
Date:   Fri, 6 Sep 2019 13:23:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905214915.13919-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06.09.2019 0:49, Niklas Söderlund wrote:

> The hardware do not support capturing the field types V4L2_FIELD_SEQ_TB

    s/do/does/. Just one typo. :-)

> and V4L2_FIELD_SEQ_BT. To capture in these formats the driver needs to
> adjust the offset of the capture buffer and capture twice to each vb2
> buffer.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
