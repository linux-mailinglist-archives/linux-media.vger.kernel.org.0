Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1F26407EF
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 14:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbiLBNur (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 08:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbiLBNuo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 08:50:44 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CB6D15AF;
        Fri,  2 Dec 2022 05:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669989043; x=1701525043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4dNf6I1zcq+VroSuL2tnHTg5Gv9/cmzKgvXa5tM1jPE=;
  b=SId8ULauAyE5C7hc0u+FkH4OhOfYTMO8nnQgx2NDUtMqGh4ywuETKKq7
   tlY5faUJhjqaKkeXpOv4aMn97AN+OlO/+frZJ4CV5v5IiHvzPWpsceS1Z
   OKpMDEyARNSQ8QYUHN+pB6TKApwAY4fGdsCgsSEtjHBqjKsGGIUrwRcUu
   EqIRUdQayznhsRvXAzXCbDG7KLeL+anFZ55rMqRdUSSq9+mngXGqIHAUl
   s1JMgA+4XRWnhTbjvKKxqUy5QiyFNnzoQ+yMEohh+bcYlPee1TYhdjnvy
   phRdZ4utMwiivYsRglW7rqR/dBpa/8sOBGFENImhdFy/Gq6Hbc00mOu7N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="315982842"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="315982842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:50:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="675833539"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="675833539"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:50:40 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4BB5120363;
        Fri,  2 Dec 2022 15:50:38 +0200 (EET)
Date:   Fri, 2 Dec 2022 13:50:38 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/6] ov5693/int3472: Privacy LED handling changes + IPU6
 compatibility
Message-ID: <Y4oCrqwwqG5zvBy5@paasikivi.fi.intel.com>
References: <20221129231149.697154-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129231149.697154-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Nov 30, 2022 at 12:11:43AM +0100, Hans de Goede wrote:
> Hi All,
> 
> The out of tree IPU6 driver has moved to using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).

For the set, with comments addressed:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
