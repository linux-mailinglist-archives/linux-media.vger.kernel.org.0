Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 536423156BA
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 20:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbhBITXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 14:23:14 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:41153 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233493AbhBITMQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 14:12:16 -0500
Received: by mail-ot1-f53.google.com with SMTP id s107so18461455otb.8;
        Tue, 09 Feb 2021 11:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bGlaQiCrkS/pfmikGaky45h5FdObmTM7r7/TdtHHYjY=;
        b=tdUWiHYPmsDgqdEDRqdYxd4yQtIWP3mQshb9viWvw7je4rjy0oH9zGislQ3nhau/eK
         4qVPoF6wGkd3hWqDkLFtEHZgYQOf/SnX44MkFqmWSYkqAa5612C6WJBugZDIzL77eKRB
         SBYMMvqTTbGyoKeY8y8oew4G9WDi87PDBymjXQD4/xV2vkjKVU/d42lbJ18MgB/kPZom
         2rF5XrDvYjC94vsa75BylTXLRuhFTprpDez/5UDdjH+X1O6G6GD49FhKAt5Bfgi4+ZEi
         F1wskj5cB3Oi2oFTA+5yYZrH5FhCdw0W9l1QQFXCLpXW+5cUCncs0o48xO6i56BCLxOX
         PSLg==
X-Gm-Message-State: AOAM530D56L/Kg659va1rtD9uw9YpW/zeXVd+7XIgn24SEtIohrflJZl
        3Ifq045Vrm9KMh0Z4HZe3RfF4ZhHvw==
X-Google-Smtp-Source: ABdhPJzm06lWmZKudWGvyQBUFR55324LPYHa8dAIQmNX5vOCBWP1mwgX2hra0dPnpwDKnBFLhUXJnA==
X-Received: by 2002:a05:6830:1481:: with SMTP id s1mr5490608otq.206.1612895502055;
        Tue, 09 Feb 2021 10:31:42 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r22sm4507917ote.12.2021.02.09.10.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 10:31:40 -0800 (PST)
Received: (nullmailer pid 4102619 invoked by uid 1000);
        Tue, 09 Feb 2021 18:31:37 -0000
Date:   Tue, 9 Feb 2021 12:31:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     linux-kernel@vger.kernel.org, linux-imx@nxp.com, vkoul@kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        narmstrong@baylibre.com, jonas@kwiboo.se, robh+dt@kernel.org,
        kishon@ti.com, linux-media@vger.kernel.org, shawnguo@kernel.org,
        jernej.skrabec@siol.net, a.hajda@samsung.com, airlied@linux.ie,
        devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, mchehab@kernel.org,
        Laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v3 11/14] dt-bindings: display: bridge: Add i.MX8qm/qxp
 LVDS display bridge binding
Message-ID: <20210209183137.GA4102564@robh.at.kernel.org>
References: <1611737488-2791-1-git-send-email-victor.liu@nxp.com>
 <1611737488-2791-12-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611737488-2791-12-git-send-email-victor.liu@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 Jan 2021 16:51:25 +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qm/qxp LVDS display bridge(LDB).
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Drop 'fsl,syscon' property. (Rob)
> * Mention the CSR module controls LDB.
> 
> v1->v2:
> * Use graph schema. (Laurent)
> * Side note i.MX8qxp LDB official name 'pixel mapper'. (Laurent)
> 
>  .../bindings/display/bridge/fsl,imx8qxp-ldb.yaml   | 173 +++++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
