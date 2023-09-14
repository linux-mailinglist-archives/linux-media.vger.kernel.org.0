Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784517A0840
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 16:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240593AbjINO7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 10:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240347AbjINO7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 10:59:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2AD1FC7
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 07:59:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739DBC433C8;
        Thu, 14 Sep 2023 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694703577;
        bh=aJiBLrVkFJvxFmDtfGVyXy25NhgD2/H7bZQp+6GV5Ko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J1RDcJHeFcasRT0frX/jbBqGjIQufBXPX3ZwCgJ3s8SA4bL0Rkpye99j6PHNHrClz
         Jg3e5v3f6XlKRmIgP0aZEhwMxKFJtYKYozJ99h25TOw1Iny88VyhAWH0v+BmOiDYE1
         BNVOSJdHmL+rCIQmGWa8V3Db93FQ9lsBC6/n6HkejeY2SmmkeZFYQmm6JJDs3uy1zU
         Iz1k1c/cTiXPzJlDYntX6xUpWjvpWpGfnUCLm6EUhIZ/+S7Z2YU1xt1TrfXITXZiVY
         8w595bnHDoDOVdSaC45/xTkTJ0SO1q2Z11VtnwvGxMkFzB2uN0fULtNLQ8X6Lwsjj2
         gwcyh4tgdJdQA==
Received: (nullmailer pid 1283942 invoked by uid 1000);
        Thu, 14 Sep 2023 14:59:35 -0000
Date:   Thu, 14 Sep 2023 09:59:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     sakari.ailus@iki.fi, mchehab@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v4] media: dt-bindings: Add OV5642
Message-ID: <20230914145935.GA1276539-robh@kernel.org>
References: <20230913192811.1946423-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913192811.1946423-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 13, 2023 at 04:28:11PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> As explained in the description text from trivial-devices.yaml:
> 
> "This is a list of trivial I2C and SPI devices that have simple device tree
> bindings, consisting only of a compatible field, an address and possibly an
> interrupt line."
> 
> A camera device does not fall into this category as it needs other
> properties such as regulators, reset and powerdown GPIOs, clocks,
> media endpoint.
> 
> Remove the OV5642 entry from trivial-devices.yaml and add its own
> ovti,ov5642.yaml.

Many of these Omnivision sensors have the same supplies and same GPIO 
connections, so why can't they share the binding? There are some 
differences I've seen that boil down to just what the driver decided to 
require or not, but that shouldn't really vary. See commit 44ade291b77c 
("media: dt-bindings: Merge OV5695 into OV5693 binding") for example.

In any case, the binding looks fine and any merging can be done after.

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Make propeties conditional on parallel verus MIPI CSI-2. (Sakari)
> - Remove clock-names as there is a single clock.
> - Pass bus-type.
> 
>  .../bindings/media/i2c/ovti,ov5642.yaml       | 141 ++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  2 files changed, 141 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5642.yaml
