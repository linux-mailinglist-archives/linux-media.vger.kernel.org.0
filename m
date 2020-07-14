Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F86A21E423
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 02:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgGNAAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 20:00:36 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43359 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNAAf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 20:00:35 -0400
Received: by mail-io1-f65.google.com with SMTP id k23so15421664iom.10;
        Mon, 13 Jul 2020 17:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HcVlx3cR7khqkWWGJ+LiqzhfLBQSCOJE5FEqXVNq8Vg=;
        b=JA2A/8aP0AlOsjsyosO8xOClF1zCKWtEiUC67m458QgJao9QC5+LvVFKumKK5Xwhvq
         5gkuza4hPnoDycAWBGTtAyWoYguIvBnINvulSov4UjVm+CrYYf1WetlPUja0NqLyjGo3
         ijyUpmWq/Hl3XmmcTA4C8aPc0OX+6Wm20ndx+SNg3O8fptyebk5kc1kEx4n1KvRvCjnF
         q8pnBgqoAy8OEC4th+pKDmX3LRiyBOQFLo3octyeQf7yLD7B1I07lauARv1mmyOmb3zg
         0jmemY7hTAg6S0G4zHs+1NB9CJr9KwvxDhCv0E7FVBfNJuqoi3B6Qj8N6livJq1xfUgh
         3aSg==
X-Gm-Message-State: AOAM531IGrD+Z47Cy4fHS8elvL9a/C9yuDqxEQj7Mp2izV+WAXbd3cAQ
        o2IcZW7MzEg3qSfs+uVEyMFF/6eQx+wp
X-Google-Smtp-Source: ABdhPJztNZI9s7ao+xl33WqViPfvZFK/U14n+YkWPfYxZTtVi4c6PBICgy8Gcdi2t6uYmkbgXy8yqQ==
X-Received: by 2002:a02:694c:: with SMTP id e73mr2960425jac.17.1594684834795;
        Mon, 13 Jul 2020 17:00:34 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t83sm9192280ilb.47.2020.07.13.17.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 17:00:34 -0700 (PDT)
Received: (nullmailer pid 963353 invoked by uid 1000);
        Tue, 14 Jul 2020 00:00:33 -0000
Date:   Mon, 13 Jul 2020 18:00:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: media: renesas, fdp1: Convert
 binding to YAML
Message-ID: <20200714000033.GA963323@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 21 Jun 2020 03:47:30 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car FDP1 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,fdp1.txt           | 37 -----------
>  .../bindings/media/renesas,fdp1.yaml          | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 64 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
