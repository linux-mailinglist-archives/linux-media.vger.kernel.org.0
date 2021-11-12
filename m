Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0DF44E68E
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 13:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234957AbhKLMni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 07:43:38 -0500
Received: from mx1.tq-group.com ([93.104.207.81]:33341 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231433AbhKLMni (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 07:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1636720847; x=1668256847;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6b3Ahxznat5ujnRBMDh/a85SJI/8DYg1lG8FShPSmHM=;
  b=Y1j5noe4/Fw7f4AiFdbcLxWtwZQak52MVlaQhB//zAp0RMlWbyk2IGAw
   cLf8g+uww7/fabOanYIbyPnmBJPnf3K7cGAa0OEPiU1JgCChSuy2rc/uw
   B3oVksEWQXGIDzF4OLGMrjQpNNnRIkoODPJuK8mGAhKeqYB+FUp31oXNj
   btMltFKBnUDEQaLL70lyvlINwPi9+b830FXXN1oPO96SlBbPHX82EwPSV
   w8fy6m6dvUl4qKJk+j0Gkdh9mF7XBu6ZoxupUJi/6KNxH2QUrKu4cAVZJ
   535V2FBINiXr/IJPzu3BVSkq/TZTUqP+HhEJkZV+0hm2O/z5USeILkG3Z
   Q==;
X-IronPort-AV: E=Sophos;i="5.87,229,1631570400"; 
   d="scan'208";a="20444716"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 12 Nov 2021 13:40:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 12 Nov 2021 13:40:46 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 12 Nov 2021 13:40:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1636720846; x=1668256846;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6b3Ahxznat5ujnRBMDh/a85SJI/8DYg1lG8FShPSmHM=;
  b=XRV05SVfOykSncq34ympLg86+qas7D1Gm93f8t4Lpgs1WNL2VrBtWpj6
   6gFyRrgQWuxWjKevXlYO/u+QCiuhGrs4jq5P2Vw2K0p/rNhfFErCIttru
   b8zxNEKVRioMRtoxJZsduQFhtWtEgwHTPKRwkuSkyNfMclcU2zsT1qpsK
   P6HzLU26Sk88P9pImSfnjJJHPqxrxFjTZS3AufcuIrfYGZl1LrBo8SGp9
   Egz+bXcbC/4APeQn03SfdpWsheqPBhsDyM1PJZuRYQYq1vDCgjszJFJZP
   2XfHDalkiXTRqRfzHYsHJ2ED3HY8i9r2JRK2Ui0KJytxvHrm4IZEM3N1K
   A==;
X-IronPort-AV: E=Sophos;i="5.87,229,1631570400"; 
   d="scan'208";a="20444714"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Nov 2021 13:40:46 +0100
Received: from steina-w (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2327D280065;
        Fri, 12 Nov 2021 13:40:46 +0100 (CET)
Message-ID: <44e674de003a8b8ebce908cebf5ea35f32ddd6ab.camel@ew.tq-group.com>
Subject: Re: (EXT) [BUG] media: imx: imx7-media-csi issue with vb2 is
 hanging / freezing the system
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        laurent.pinchart@ideasonboard.com, rmfrfs@gmail.com,
        slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org
Cc:     linux-imx@nxp.com, kernel@puri.sm, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Date:   Fri, 12 Nov 2021 13:40:43 +0100
In-Reply-To: <ab8929d22461300f0f167ab44e1b5c902dde5fcd.camel@puri.sm>
References: <ab8929d22461300f0f167ab44e1b5c902dde5fcd.camel@puri.sm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Martin,

Am Freitag, dem 12.11.2021 um 12:23 +0100 schrieb Martin Kepplinger:
> hi Laurent and all who it may concern,
> 
> Ever since I switches to using imx7-media-csi on imx8mq I have seen a
> bug that hangs /freezes the system so that I can't really save a trace
> or get logs for it. It happens not every time when starting streaming,
> but sometimes - when starting to stream frames.
> 
> It kind of looks like a lock not released or something similar, but
> some race condition might happen since it's happening every 2 to 10
> times.
> 
> For me, when it fails, it fails the first time when starting to stream
> after rebooting. If it succeeds that first time, it continues to
> succeed, until I reboot.

When I read your description I was immediately reminded to this post on
NXP forums [1].
I do not know if this is what is happening to you, but it sounds
somewhat similar. There is also an errata in post [2] describing some
backgrounds. Later posts also describe that apparently only CSI port 1
is affected, but CSI port 2 is not.
Do you have the possibility to test CSI port 2?

Best regards,
Alexander

[1] https://community.nxp.com/t5/i-MX-Processors/IMX8MQ-MIPI-CSI2-Base-address-switching-change-error/m-p/1218063
[2] https://community.nxp.com/t5/i-MX-Processors/IMX8MQ-MIPI-CSI2-Base-address-switching-change-error/m-p/1216509/highlight/true#M167970

