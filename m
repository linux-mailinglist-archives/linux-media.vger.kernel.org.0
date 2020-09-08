Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29FBE260E29
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 10:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgIHIz4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 04:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728957AbgIHIzz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 04:55:55 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67941C061757
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 01:55:54 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CB40E634C8C;
        Tue,  8 Sep 2020 11:55:45 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kFZPm-0000V5-0k; Tue, 08 Sep 2020 11:55:46 +0300
Date:   Tue, 8 Sep 2020 11:55:45 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        jacopo@jmondi.org
Subject: Re: [PATCH 3/3] v4l2-fwnode: Document changes usage patterns of
 v4l2_fwnode_endpoint_parse
Message-ID: <20200908085545.GA834@valkosipuli.retiisi.org.uk>
References: <20200908085121.864-1-sakari.ailus@linux.intel.com>
 <20200908085121.864-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908085121.864-4-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The subject should have been: "[PATCH 3/3] v4l2-fwnode: Document new usage
patterns of v4l2_fwnode_endpoint_parse".

-- 
Sakari Ailus
