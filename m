Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846E72954A3
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 00:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506461AbgJUWF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 18:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506377AbgJUWF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 18:05:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE647C0613CE;
        Wed, 21 Oct 2020 15:05:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n6so4742686wrm.13;
        Wed, 21 Oct 2020 15:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cIa7RepsUvg5hAaSeE1uSEC/ROabaaU87XY0sGpqcVs=;
        b=SAc7eE8JJUXpM7dXrb31slIlUL3LMz3IRp0p0Scg8ZGs6ROGczqhwS8iwnVK8yxL44
         lOLirDl77LjlfWAgKSuyO6LT7bNI6/zUEiBWob0nnHwrMImX0w+Narb8I/IOIbbtLbSS
         pAWoNekaF1n9o/UONpHs0LmypVc4psGGOEmTPHwI0jFpMpn+csMnMFEn95LtZuxMUd8N
         pkV6UqrG9XxiKVGNwQ0gmrNogQ5o3tKVEj93WB+/a7G3vRXa3WUq5W6i1w0WyV6PgeI7
         wVgSgK/O1KvIMrJHQy82ym38V/9CYEAs9Nu8+grY818GBqxHW6+M4Rovn+KIPy+c6kFk
         kPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cIa7RepsUvg5hAaSeE1uSEC/ROabaaU87XY0sGpqcVs=;
        b=ntMygvaN4SnrspB+xCKY58yFn6Ji+vNYMJVKIodbKJY4hLfoB+dAYkbnBDwe3HS+Hu
         HpWCQNfXvdzae/oUu22dhOx+7wfui7I+Og9GZVi6JbtjKsU63OFgRJ7DauGW+tq+lzoY
         ZAUg1pqwdjv8DcvuU8i3oIApePznsBrJ0JyyGF/Y2d/dToU1EwqGOYf7ygA/Y/9j1hYa
         NYMroYWOeNjluP3H2FtgMW20WD8fhARd5eWPurYEr7dLneehn+kFcmBGazVTu0oo2DEn
         GbcDA2tcwmorzKmyHHzLf7EicWs66n76yPWH6E8i/5rFHdiVukXYTt4U9xIL29HiUlvp
         IrlQ==
X-Gm-Message-State: AOAM5304QWbciGmDSh/o7jhguttWKc5LXfKVUhhqH8v8pWyU/aacBkfY
        rsvJaieYGQvqNtF5fgjIQRM=
X-Google-Smtp-Source: ABdhPJyc70sv1NhsR+6Lzr+4U2b4BJ4I8vciePFCOL1auG0T/70iVgQ03PNyy5K4XMqe5HJ0bLAbdw==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr6395724wrq.327.1603317957617;
        Wed, 21 Oct 2020 15:05:57 -0700 (PDT)
Received: from [192.168.1.158] ([2.26.187.29])
        by smtp.gmail.com with ESMTPSA id v9sm5327160wmh.23.2020.10.21.15.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 15:05:56 -0700 (PDT)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux.walleij@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        heikki.krogerus@linux.intel.com, dmitry.torokhov@gmail.com,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        robh@kernel.org, davem@davemloft.net, linux@rasmusvillemoes.dk,
        sergey.senozhatsky@gmail.com, rostedt@goodmis.org,
        pmladek@suse.com, mchehab@kernel.org, tian.shu.qiu@intel.com,
        bingbu.cao@intel.com, sakari.ailus@linux.intel.com,
        yong.zhi@intel.com, rafael@kernel.org, gregkh@linuxfoundation.org,
        kitakar@gmail.com, dan.carpenter@oracle.org
References: <20201019225903.14276-1-djrscally@gmail.com>
 <20201019225903.14276-10-djrscally@gmail.com>
 <20201020094113.GG4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <4ce5b55f-f492-2b52-5571-86ee346db795@gmail.com>
Date:   Wed, 21 Oct 2020 23:05:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201020094113.GG4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 20/10/2020 10:41, Andy Shevchenko wrote:
>> +	  	- Some Microsoft Surface models
> Perhaps an example? Like '(e.g. Surface Book)'
>
>> +		- The Lenovo Miix line
> Ditto.
Sure - I'll list them.
>> +static const char * const port_names[] = {
>> +	"port0", "port1", "port2", "port3"
> + comma.
I think 4 ports is the maximum for CIO2 device, so this shouldn't ever
get extended?
>> +	/* device fwnode properties */
>> +	memset(dev_properties, 0, sizeof(struct property_entry) * 3);
> 3 -> sizeof(...) ?
> Same Q to other similar cases.
Whoops, of course, that was stupid in hindsight!
>> +	if (is_software_node(dev_fwnode(&pci_dev->dev)))
> Can we use the same check as for _build call above?

And just set a flag in struct cio2? sure.


For all the other comments; ack - I'll make those changes for the next
version

