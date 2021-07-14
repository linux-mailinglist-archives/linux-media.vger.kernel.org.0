Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774953C9443
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 01:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbhGNXRm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 19:17:42 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:43684 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhGNXRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 19:17:41 -0400
Received: by mail-io1-f48.google.com with SMTP id k16so4192110ios.10;
        Wed, 14 Jul 2021 16:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h/hZfjolUitLaX6oOb58ZptnZlkhBHCK2VKrJSQEjbo=;
        b=mqQUCGItXWq/ud9ByIlqVc3MzW3G4/0OIVHdOwf6fFYVZgwL/jIXzQ6gohydfSDJNH
         xpsAh+YEl1QUphMAd7AMqIEexFISiIPTfgy/AD/1iwONfOHcz22Loe5d0ZhnBHTBfyCB
         vfH2CnqQSMH/MCBdG8QaKNvqKScs7XPPWYCDD/RNaQXDc4O7l3i3gHKWOM4qelsWXM7v
         vqSQcpUtWrhcHvez05UuNbcpNn0wucEQvcGHTE2V8LqCeGIjA7Yr4eYENA6xvgaY2hEg
         VN4UlNmJrJVcqeUTLKRGXlt9Nt1v4qduTJFP7ODdq3yiabDgmW2ALdRpAtCPIM38Jq6W
         SRcw==
X-Gm-Message-State: AOAM533vbrT79LoTPX2Gkel+bP+yCBJxoFcjM1yYTkbKk31+jf0iPVFB
        t9OVphMpivc+7IeWYMDd2Q==
X-Google-Smtp-Source: ABdhPJzhyC/vwfS+dLQILbviGnVPtuNaPRZ64Q/MD49HkxGHbQAz6dJ82PvAkfxLh4oh7NRzSDlI+g==
X-Received: by 2002:a5e:df08:: with SMTP id f8mr421399ioq.172.1626304489102;
        Wed, 14 Jul 2021 16:14:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z11sm1969586ioh.14.2021.07.14.16.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 16:14:48 -0700 (PDT)
Received: (nullmailer pid 3721314 invoked by uid 1000);
        Wed, 14 Jul 2021 23:14:43 -0000
Date:   Wed, 14 Jul 2021 17:14:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1, 12/14] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <20210714231443.GA3720388@robh.at.kernel.org>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-13-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707062157.21176-13-yunfei.dong@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 07, 2021 at 02:21:55PM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek-vcodec-comp-decoder.txt    | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt

Bindings are in schema format now.

Rob

