Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3540022B824
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 22:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgGWUvD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 16:51:03 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42743 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGWUvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 16:51:03 -0400
Received: by mail-io1-f67.google.com with SMTP id c16so7715642ioi.9;
        Thu, 23 Jul 2020 13:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=leqXvpOP3XepUFYui6d61Ti4jjLPI4rlG5fVef2PTfg=;
        b=gMBHjWFaygzAoOtOTSJAb74oVe6leQsIPOAjXqVYoLeDsYzSkNoCZhFHYzsqOejdAw
         GXC1SuXMEykz7lwvvkjRkh0C3LlzIyKiBGsc0cD+kjv5p5tZovMOIs89LSvEInBRxmWD
         j61DiDf0Co4ZOsGQCYRVNsQPpAgR3qgi7+a1sSlH3B4Z6fyWduc89pHDBZz+pR10966x
         o+7TohLyj6KjIPgfvLnXc5Q8gsKm6ujhQSlIR0YJTmrW4gk5c7OaYH0MGFQInWhX2gDQ
         bg9n5k8hrpCVNsNTqT2NfhsW2zeNSkIba7AOL5ea3y2SfyyfgZ+5jfTS0mdy999FW0en
         0KYg==
X-Gm-Message-State: AOAM533iHgsnpEJxHpzdMvh1ZFV2Z9MryZiO653eDDbTk0H2gbPbAfu4
        7lBAxjmWbENpjzG5ZarQBw==
X-Google-Smtp-Source: ABdhPJymQDB2nB1jG1HWBJy8nYZ8UjCyxIJtkZoOiBR/OCyELkd1TQwRe8rX+Jrj3GhsktMnaMXUlw==
X-Received: by 2002:a05:6638:164a:: with SMTP id a10mr7201921jat.126.1595537462187;
        Thu, 23 Jul 2020 13:51:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm2033939ilo.68.2020.07.23.13.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 13:51:01 -0700 (PDT)
Received: (nullmailer pid 837909 invoked by uid 1000);
        Thu, 23 Jul 2020 20:51:00 -0000
Date:   Thu, 23 Jul 2020 14:51:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Santiago Hormazabal <santiagohssl@gmail.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add KT Micro
Message-ID: <20200723205100.GA837861@bogus>
References: <20200717004441.116248-1-santiagohssl@gmail.com>
 <20200717004441.116248-2-santiagohssl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717004441.116248-2-santiagohssl@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 16 Jul 2020 21:44:39 -0300, Santiago Hormazabal wrote:
> Adds ktm as the prefix of KT Micro, Inc.
> 
> Signed-off-by: Santiago Hormazabal <santiagohssl@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
