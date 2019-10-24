Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED240E3F4C
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 00:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbfJXWUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 18:20:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38347 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730365AbfJXWUP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 18:20:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id 3so38432wmi.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=i4kWkR2DIQ769dd1FClL088PqDlU2bz/Z0/RgPWQJb0=;
        b=Ych2xCYNbsO55XC8/z2xoGwDZUKuuA4OTQYHoWcCWF8gMlv1UmJjn3Ic+4mDg8Mylk
         uK+2B4iesIwa6ZMxPnXluqU59xydn5BOlzxrvoQTWQQ6v1u2SRZk7piwMM7cBBUPbOyV
         6NPwt2DwsUXRIq++OzxVcywP9WPWFYzqbZWIQaoVWahq7CI6Nt8rtV18hCCPSBUXnFvw
         0/0rXwjGFHJBmbx8jtE0bmwzXmGsORB2irZ8YV2unMiTkmA+E3Q7kNUayhmAvH/DjVdk
         WgShOXeGzfKEgMQcAdvjj2QUbhPbVuwlmH0NSrBF+UQ5HA5PrKntWViIHq57DkgmCVhl
         6dtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=i4kWkR2DIQ769dd1FClL088PqDlU2bz/Z0/RgPWQJb0=;
        b=rGzansrVDk6r2jdEsTQO0e78++QmfT+NHdhATTo1UQCQIKkQsRtp9xUqVChgnc+4z6
         T3pLVN9vJlNGBa+oHcR1l1ixr1gpfyAfza04p6Pn9BDJzNMgw8bZMlDjzUl0/qoFAFMK
         d0JEouCEMJtaqVo4kxGBM3uBCIc3AhtlQv0aR8lFSSGaZq/xfL/d/2RRvZMy9kKQ+7v0
         hr2j2vSAt1nur6nlus1LnO8yQ7VJ2RItxlHl8JnLNkoloD9VdwqwC1xeQYbGa363l+Sg
         /ABQ/wH8OGhRO8RlC1nuD5YswccytO7ps5QcrhhXy803wIO1uPl+lI7FU4sWBu5sxNfx
         MXHw==
X-Gm-Message-State: APjAAAXL3q6PJFsTcGU3FNW2Tbhn02BjnDK4eBD3yPiMFiZNjoDf2gNE
        nCHOABJXeIpk/vArOBtxjz0=
X-Google-Smtp-Source: APXvYqxTKffgFgi4z6FSelFLh6q+MNdxZVHReuSL5AXHKVXuBLy6vEJz/IXEnMBmYPAuEsVWRy6EtQ==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr426124wmk.173.1571955613176;
        Thu, 24 Oct 2019 15:20:13 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id f18sm82266wmh.43.2019.10.24.15.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 15:20:12 -0700 (PDT)
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-2-laurent.pinchart@ideasonboard.com>
 <CAOMZO5C26mtWCOE_5griYunN=PZ=dFFs5B--ADoVmKqur1yMUw@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/7] media: imx: imx7_mipi_csis: Power off the source
 when stopping streaming
In-reply-to: <CAOMZO5C26mtWCOE_5griYunN=PZ=dFFs5B--ADoVmKqur1yMUw@mail.gmail.com>
Date:   Thu, 24 Oct 2019 23:20:10 +0100
Message-ID: <m3woctdbvp.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Thu 24 Oct 2019 at 18:43, Fabio Estevam wrote:
> Hi Laurent,
>
> On Thu, Oct 24, 2019 at 2:41 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> The .s_stream() implementation incorrectly powers on the source when
>> stopping the stream. Power it off instead.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Should this one have a Fixes tag?

let me help you on this one:
Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")

---
Cheers,
	Rui


>
> Thanks
