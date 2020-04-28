Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6885E1BBD1D
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 14:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgD1MJq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 08:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726635AbgD1MJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 08:09:46 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AA2C03C1AB
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:09:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id j3so21139203ljg.8
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2020 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dGh86yHJzHQj1Q9JfV5v+jXns7wPEiXUhEvecwcF/no=;
        b=WUdWK5v1ZvJS76cJcd1tB/dk54DyJwxTguHa/lYgoX1fpw7A4p8/UYLfOmiprSu74g
         uUfnvfywBJOAIvp+Eiyk79D+aKSyYqI5Eu8fdg/UG1xWnNM1S8Z2nE096XxAV2fWcyaB
         kGtdleShrmApUOwufrQFF1sqETV4hIhAS7o+lW4afST1XDBVKjBuAyEg4+LDoYh5toLf
         3jSjoyoz+h+LbKkzXLjnj7I3JzwAxSbnjLIz2Fkk4ezEwDBctu1lNCh5hdi6j1HRekHs
         zXE4SEuUSvDApgN1Ei1ZYhrv9GawwVQNGACBJ3stI2lnFhmLqTnJiOLUHq7ebWAV0ZrR
         n3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dGh86yHJzHQj1Q9JfV5v+jXns7wPEiXUhEvecwcF/no=;
        b=amAinrzN86gr9yEtnNQPM6NAry90coVXUJxAt2EROOuUlfqpt8XL5SvVKq39hV688s
         9PEgaZxoVJisAQJA+WUvvvzHQy4qrqV86y+bJJBHhKUgdC5z6pNGUadmIbi/kPgq/INk
         VY5hRCdTt8hLzDHOMQ/+zn/lxq4dI35/EOs+Kg2xiyfPNmsTD2uSTHafVGzwPWYplAJr
         n5kIlcp7YAhEimtZYR7xWpmP9rh1jpUBqfweHsN0wu+5R04tcBNIXTpPUN5C7eudgdMZ
         /vRrbSr2H2bn/zp70jr2PjKhyQb67sjUYU/RaZFbql/PtNyt/G2h1mvIt3KaOVU3Odu6
         7nhA==
X-Gm-Message-State: AGi0PuYop9DMPr5UAytnhqsy9V+K0UFzkfIUwrf+1U/kq9cIqwiE/t4l
        ODmeZ8aFAuibL8D+YPGCGnGHCg==
X-Google-Smtp-Source: APiQypJTWg2O9k5BTzh6MOsyI5sbbwLXYKrzduwzg1bod7yNjhrvuH0SGz7fVBBT3wuXlallY66LnA==
X-Received: by 2002:a2e:3e15:: with SMTP id l21mr17395453lja.251.1588075784302;
        Tue, 28 Apr 2020 05:09:44 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id j8sm13970024lfk.88.2020.04.28.05.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 05:09:42 -0700 (PDT)
Date:   Tue, 28 Apr 2020 14:09:42 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] v4l2-compliance: zero mbus_code
Message-ID: <20200428120942.GC1372619@oden.dyn.berto.se>
References: <5cf00351-bf5f-b347-0ab5-9ea260a7bc85@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cf00351-bf5f-b347-0ab5-9ea260a7bc85@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your work.

On 2020-04-23 12:48:20 +0200, Hans Verkuil wrote:
> The new fmtdesc.mbus_code should be zeroed by applications.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 824769b3..269a5fd9 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -235,6 +235,7 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>  		memset(&fmtdesc, 0xff, sizeof(fmtdesc));
>  		fmtdesc.type = type;
>  		fmtdesc.index = f;
> +		fmtdesc.mbus_code = 0;
> 
>  		ret = doioctl(node, VIDIOC_ENUM_FMT, &fmtdesc);
>  		if (ret == ENOTTY)

-- 
Regards,
Niklas Söderlund
