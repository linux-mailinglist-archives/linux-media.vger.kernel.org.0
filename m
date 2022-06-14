Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D47C54B1E8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 15:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238629AbiFNNFn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 09:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbiFNNFn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 09:05:43 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8077DDF89
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655211940; x=1686747940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G58EvEW+xU2yxr+vTA79vx3Fmm53+RfSYVvtIrW9a4g=;
  b=CNkee0yTLUY7SOgpZjKBSTM5WF3pEfzeHJUPXLupFepqEtocPQWAaJ+z
   ey9ylD2+dYx3dJbPHnHWrhz+qcbT3DIyXXmynfmA8GrAK4vxLw7tGUeSY
   HUeIzRBcBUOtIMnEvaiWkWrSXIa9oerFCmqMEh/0C/mM/1PoljpFtdAYi
   1qFHY4bbuPH4w0hWLUdiCeZTsqU7mUaqAAQ8+llTNMz8kh0s7eBq/lLxA
   KrATk+B2uhX13N0jBWogEGSCuYGON2OUyABn0Ap1RPkqMx1BFaKPfpSLY
   u3er02nNzf202xaquN57h+mNwpMDjZp/9ReYNzB2+bEebjUANYL5XioeD
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="304023542"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="304023542"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:05:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="761954712"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 06:05:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1o16Ee-000cNM-JI;
        Tue, 14 Jun 2022 16:05:32 +0300
Date:   Tue, 14 Jun 2022 16:05:32 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 15/40] media: atomisp: drop hmm_page_type
Message-ID: <YqiHnHmzcK/QlpWK@smile.fi.intel.com>
References: <20220613195137.8117-1-hdegoede@redhat.com>
 <20220613195137.8117-16-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613195137.8117-16-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 09:51:12PM +0200, Hans de Goede wrote:
> Since the hmm-pool code has been removed this now always gets set
> to HMM_PAGE_TYPE_GENERAL, so just remove it.

...

>  struct hmm_page_object {
>  	struct page		*page;
> -	enum hmm_page_type	type;
>  };

Not sure if you have the same idea after this, i.e. replacing custom data type
by direct use of struct page pointer.


-- 
With Best Regards,
Andy Shevchenko


