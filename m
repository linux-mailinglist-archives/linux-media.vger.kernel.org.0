Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C741A88F2
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 20:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503690AbgDNSPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 14:15:02 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42335 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503671AbgDNSPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 14:15:01 -0400
Received: by mail-oi1-f196.google.com with SMTP id d7so6208789oif.9;
        Tue, 14 Apr 2020 11:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=65DkFlztgppXvsQRy19eL08nR3Skwie1axX0JEZh0zY=;
        b=XzsdHTAejPSOccwdYKT/xRkFiybbt65C4M0dVQthIjsa9Gfz1W/RYrYB2+/FY8jlnw
         XvUbaG+/xpHQH+riMfSDQ6Wiqz/W5iXWtnmYjhT1t2BVgEG85wHgGnHX+YD3Eueidnat
         VbNRnp1lZbuUX2/uJ1bnfepSXBg+M2gw9nxs//MWP3Nq8Y1bMvRoarsFk5HM1xVlWbII
         8MWo+mMr94p574S+oLyBGP96xGG56L6kjNnZjWVf0J9kU6UrCK77kq595iz/FrEoULgT
         ZH77DwpqZEljo9d8XlRUYXkOwPFiXO+wpIZ/STHR3T/8xOx4MzKT/9MAHtLez5gLcEry
         2uww==
X-Gm-Message-State: AGi0PuYOhTtPV+D2294deU9wtvduf2Th/ohfocRjEf08uQWOJZzUx4hi
        LMtXjU2k1EhYBPFcUxNSVA==
X-Google-Smtp-Source: APiQypI6GHk8xdPK5wkkeoLMN/Gum7n0XE1rJqDu/xuakTvwO6qkRDc9XPA/bZoazZ2j983VfpVHkw==
X-Received: by 2002:aca:4243:: with SMTP id p64mr16670247oia.21.1586888100393;
        Tue, 14 Apr 2020 11:15:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i17sm5660774otc.16.2020.04.14.11.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:14:59 -0700 (PDT)
Received: (nullmailer pid 18162 invoked by uid 1000);
        Tue, 14 Apr 2020 18:14:58 -0000
Date:   Tue, 14 Apr 2020 13:14:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     skomatineni@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com,
        sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 8/9] dt-bindings: reset: Add ID for Tegra210 VI
 reset
Message-ID: <20200414181458.GA18112@bogus>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-9-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585963507-12610-9-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 3 Apr 2020 18:25:06 -0700, Sowjanya Komatineni wrote:
> This patch adds ID for Tegra210 VI controller reset to use with
> device tree.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  include/dt-bindings/reset/tegra210-car.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
