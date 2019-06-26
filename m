Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D746570C3
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 20:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbfFZSfq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 14:35:46 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52781 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbfFZSfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 14:35:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so3136055wms.2;
        Wed, 26 Jun 2019 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JwwlhRes3eA1e/9Q/hAaa2AfY6tnj486mE1SbBlz0rU=;
        b=fqEUFEYw9qv3t6ezbWG5URRezYfRHUtrM1lTZFignM+UEuk6nmumDvMNaEbwV8B6/U
         a88d3u1uY3AW5HO8EX/hZ+2slvvCnfRIbnPSlcsmlmXRwSqLJKSSMw521Rcf/frdz8Ju
         VCQlnrE3gKEwXtlFjm7d+FqSMzecYPrY0CbuPatlexyVySbprIjAZgJO1Fxmoh2IkP1c
         76xAzTct5LXCtynhA/ro/Ue7Z5yg6qHLXPvOZe9FE32Juvcfc4YZcHpcbSYEugFCIW1D
         5tP0QtmDMGKaIhWSfXuIlEQeHyjZrKrYIQpPDv5i2zTX5oqbc39/LKvxigMd6OIKPshr
         DOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JwwlhRes3eA1e/9Q/hAaa2AfY6tnj486mE1SbBlz0rU=;
        b=c08xaPzioTFxBcF6z13ICi6o9jLVJJkb20wGyKGRLYIVmd/ecj2ihSXHWINExA2b3O
         UUC9nM8kKID734k+zAy+JQqDj4H9BTCPqeM89gcZgEJJUkJaiWfUCBrcW1wRLGnYOOk0
         +rHJvd/M1XfapZAD+fP9msHhIkQhDnFm3IGkNNdaz36xgmChmmqreaILzwLY+eiSMSV6
         oEx9q3IPjczuUKb6rgIjYsXiHK7ErVQgfLvJeW+Tt8PmLodXkrtW8lno3nGjDWGIzaJA
         euIc4TMQJjWCcbxDPH3kAdvYDXxc2Iij4izubBTCYwUJnLG3fxAgv5j3k7COWcDulMBS
         E6og==
X-Gm-Message-State: APjAAAVNAtroP/WmGJgpDypPsrRdvJpyzKk0Om/M7dzyL5CGziX3fuC5
        xMqU/hlBAHHI24sSTWMjX7QzLu7W
X-Google-Smtp-Source: APXvYqyq7eim+ZRBTCdydue2wqc7N3iBFvdNRciIZbxjR7OLY0XqW731SSbiJw0uh41ze5RKeO5kEg==
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr287046wml.90.1561574143412;
        Wed, 26 Jun 2019 11:35:43 -0700 (PDT)
Received: from [172.30.90.108] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id c1sm36562604wrh.1.2019.06.26.11.35.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:35:42 -0700 (PDT)
Subject: Re: media: staging/imx: Improve pipeline searching (bug report)
To:     Colin Ian King <colin.king@canonical.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <9b6d7f0e-f191-e5d5-e20b-9244800678fe@canonical.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <fa12f7f7-c2c8-6777-0359-8bdd8290f517@gmail.com>
Date:   Wed, 26 Jun 2019 11:35:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9b6d7f0e-f191-e5d5-e20b-9244800678fe@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for catching,

On 6/26/19 11:27 AM, Colin Ian King wrote:
> Hi,
>
> Static analysis with Coverity on Linux next has found a potential issue
> with the following commit:
>
> commit 3ef46bc97ca2c918b7657a08220c7340a9bb07a2
> Author: Steve Longerbeam <slongerbeam@gmail.com>
> Date:   Fri May 10 17:50:11 2019 -0400
>
>      media: staging/imx: Improve pipeline searching
>
>
> The issue is in drivers/staging/media/imx/imx-media-utils.c in function
> find_pipeline_entity:
>
>          struct media_pad *pad = NULL;
>
> pad is assigned a NULL
>
>          struct video_device *vfd;
>          struct v4l2_subdev *sd;
>
>          if (grp_id && is_media_entity_v4l2_subdev(start)) {
>                  sd = media_entity_to_v4l2_subdev(start);
>                  if (sd->grp_id & grp_id)
>                          return &sd->entity;
>          } else if (buftype && is_media_entity_v4l2_video_device(start)) {
>                  vfd = media_entity_to_video_device(pad->entity);
>
> ..and above the null pad is being dereferenced causing a kernel oops.

yes, this is a typo and should be:

vfd = media_entity_to_video_device(start);


Sending a patch...

Steve

