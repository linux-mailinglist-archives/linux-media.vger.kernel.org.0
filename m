Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFABCF99A6
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 20:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfKLTXM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 14:23:12 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45290 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbfKLTXM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 14:23:12 -0500
Received: by mail-oi1-f194.google.com with SMTP id 14so9898665oir.12;
        Tue, 12 Nov 2019 11:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ql2YP585ul4BHev5EkhbRKGKXRaBKCQ6B/5ZmE6b9jE=;
        b=N7Mw+oQJ70U+Z7B5nkNf7PZT/+RtSaEjDBMB9MQ/Kc/hpM3ufr0WMmjbCGLrxXiPuZ
         j3fdkreOR4qFzOD59dG4MmmMoBRkXzFx+hkHG7tiNaDqIMu/jixL3Z6giQ+v5TRdzHLa
         ILQGe7H2hnqWGMQapD52ntDdUXrxim54dxHKCiUXOaBZ4O/0tvIujfuQUisV3nKhuMdJ
         m5f5aOj4N1sekvcx1Xl7TLaUDzpiK9/EURZBqKQExYi/Z/M1QsiF1tfxDiK4rcwGhXw1
         7bAtn9QEy8bx6om63QVTxpBwfPabb/Qy+sePaOkeqmTddlqDBerNi6BIIS7q+98jSd96
         66wQ==
X-Gm-Message-State: APjAAAUA2hM4/Iuv9urj7Wr8+AMY6pauq6vImNu9ZA/lnlymC+wph2/R
        1nA1EC3kl0Y5vtNdCidvpw==
X-Google-Smtp-Source: APXvYqwpAg/s731w906mekDfdSmHaxcCtz9t9bPGIbbHis2UVHnw9PQ6olnrFewGtotLl6Q99qG/WA==
X-Received: by 2002:aca:58d6:: with SMTP id m205mr539096oib.32.1573586590813;
        Tue, 12 Nov 2019 11:23:10 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v8sm5746277oto.52.2019.11.12.11.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:23:10 -0800 (PST)
Date:   Tue, 12 Nov 2019 13:23:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 01/11] dt-bindings: video-interfaces: Document
 'location' property
Message-ID: <20191112192309.GA12976@bogus>
References: <20191108155944.1040883-1-jacopo@jmondi.org>
 <20191108155944.1040883-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108155944.1040883-2-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri,  8 Nov 2019 16:59:34 +0100, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify a device mounting
> position. The property is particularly meaningful for mobile devices
> with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
