Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D06317DC6B
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 10:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgCIJ30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 05:29:26 -0400
Received: from mail-pg1-f170.google.com ([209.85.215.170]:37253 "EHLO
        mail-pg1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgCIJ30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 05:29:26 -0400
Received: by mail-pg1-f170.google.com with SMTP id z12so4451048pgl.4
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GyFtCdRxR6sVhw72KswIK0rDXamwneP6LD6kWfJp1pc=;
        b=RCzJvzdseBmJqOvEfcFOWx3FDbQWFcOvN13MelV3ubCWasbOfIICbV1Xt8Cl+IGAxp
         VCF4OHvnNBa/q6tTTGlZpBO3DwbV0vGrgUTGApyfClRP8Ot5HaP3ddHTqb0llWbUIN7t
         TsJpvI0gFscNO/nvlU/TpFcSiRunodUd5MRrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GyFtCdRxR6sVhw72KswIK0rDXamwneP6LD6kWfJp1pc=;
        b=FdyIRsSB/s06TiFpkJ9m8CXYKi7GlrPlp57+S8wD7GUgN4WUAJkhSVb+Uu57gPanDY
         7MwVJl0zHsYkemBxPVdjFFW4o8K4KG9826faAyaqXmLn8SYNWXP1Q7NNGgT2BaTLrYam
         002PjiCSgjwkmwjteInVJlUt8c7SU6Mb5qES8PQdGS1cmJBGyxj0OyNHXiHOJWQaLR59
         XQYwPGMbNpPFpzApsjnUEiGOuqvkwWx6Vz0shdl0tn6HIpW0XG8p/9Y7VIu/aaEiewLW
         3l6qr+Di/OF5cm+xISSni7j0ulygq8PvSFri2lxdjmSEqVaNsNeZD5qNxkevhVH032ZL
         i9hA==
X-Gm-Message-State: ANhLgQ3NXo6v+fVqL27c60aDlhsbGoHDmvKduzGWFv/aFIDrtZI0yUFo
        CP0p+6j57gpK8vVJ72duu8eXJg==
X-Google-Smtp-Source: ADFU+vsk2pdMU3AJSsduLv1AvRkyUmXAC+5jInBmomYPmE3cw6Hj6w2NZASekEuWgdN18gXfuZcSFA==
X-Received: by 2002:a65:669a:: with SMTP id b26mr15435134pgw.24.1583746164892;
        Mon, 09 Mar 2020 02:29:24 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id a3sm21102522pfi.161.2020.03.09.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 02:29:24 -0700 (PDT)
Date:   Mon, 9 Mar 2020 18:29:22 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCHv4 01/11] videobuf2: add cache management members
Message-ID: <20200309092922.GB231920@google.com>
References: <6f5916dd-63f6-5d19-13f4-edd523205a1f@xs4all.nl>
 <20200307112838.GA125961@google.com>
 <a4d85ac3-0eea-bc19-cd44-0c8f5b71f6bc@xs4all.nl>
 <20200309032707.GA9460@google.com>
 <40cd09d9-49a6-2159-3c50-825732151221@xs4all.nl>
 <20200309072526.GC46830@google.com>
 <e31197b6-5d22-0c3a-cc77-e9506136ada5@xs4all.nl>
 <CAAFQd5Ajopb019HZmtNJfDZmZbssDHfztmT0BvAD07QttXmZ1g@mail.gmail.com>
 <20200309090802.GA231920@google.com>
 <CAAFQd5BH2rFZkABej+JfW76f2tjmBBKWm8WjW+TOTBjfewm_9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BH2rFZkABej+JfW76f2tjmBBKWm8WjW+TOTBjfewm_9w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/03/09 18:17), Tomasz Figa wrote:
> 
> I think that's fine, but we need to make it explicit. :)
> 

I'll improve Docs.

	-ss
