Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5027238B4F4
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 19:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235032AbhETRLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 13:11:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:62340 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231561AbhETRLd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 13:11:33 -0400
IronPort-SDR: QXiBuCEEvNv52pnN2uou5bfxnSc2BdWIbHW6sQiNNbPy8IItRPW6hEYjxx4Ae79Q/6z8BOJi63
 386nKlZuPtvw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="199333862"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="199333862"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2021 10:09:12 -0700
IronPort-SDR: +2ZaOA5SC3oG3LBQbIQktOQXJCOAFLaDHB3V6sStSzAN5PE1lsvC5F9l0cF+dJP5C4ggjhI0QG
 S9BgBZOlWI5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="612923349"
Received: from lkp-server02.sh.intel.com (HELO 1b329be5b008) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 May 2021 10:09:10 -0700
Received: from kbuild by 1b329be5b008 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ljmAX-0000fo-Io; Thu, 20 May 2021 17:09:09 +0000
Date:   Fri, 21 May 2021 01:08:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: [ragnatech:media-next] BUILD REGRESSION
 c4fb2697f420b3c752230d8060801681bc486c04
Message-ID: <60a6978c.a9jWN3+azGtpI71y%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree/branch: git://git.ragnatech.se/linux media-next
branch HEAD: c4fb2697f420b3c752230d8060801681bc486c04  Merge branch 'media_stage' into to_next

Error/Warning reports:

https://lore.kernel.org/linux-media/202105192044.UM4pvsch-lkp@intel.com
https://lore.kernel.org/linux-media/202105200133.GkJR8CwO-lkp@intel.com

Error/Warning in current branch:

drivers/staging/media/hantro/hantro_drv.c:157:26: warning: variable 'src' set but not used [-Wunused-but-set-variable]
drivers/staging/media/hantro/hantro_drv.c:157:32: warning: variable 'dst' set but not used [-Wunused-but-set-variable]
drivers/staging/media/hantro/hantro_drv.c:165:3: error: label 'err_cancel_job' used but not defined
drivers/staging/media/hantro/hantro_drv.c:168:24: error: 'ctx' undeclared here (not in a function)
drivers/staging/media/hantro/hantro_drv.c:168:2: error: type defaults to 'int' in declaration of 'ret' [-Werror=implicit-int]
drivers/staging/media/hantro/hantro_drv.c:168:2: warning: data definition has no type or storage class
drivers/staging/media/hantro/hantro_drv.c:169:2: error: expected identifier or '(' before 'if'
drivers/staging/media/hantro/hantro_drv.c:172:2: error: conflicting types for 'v4l2_m2m_buf_copy_metadata'
drivers/staging/media/hantro/hantro_drv.c:172:2: error: type defaults to 'int' in declaration of 'v4l2_m2m_buf_copy_metadata' [-Werror=implicit-int]
drivers/staging/media/hantro/hantro_drv.c:172:2: warning: parameter names (without types) in function declaration
drivers/staging/media/hantro/hantro_drv.c:174:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before '->' token
drivers/staging/media/hantro/hantro_drv.c:175:2: error: expected identifier or '(' before 'return'
drivers/staging/media/hantro/hantro_drv.c:177:15: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
drivers/staging/media/hantro/hantro_drv.c:179:1: error: expected identifier or '(' before '}' token

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- arm64-defconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- csky-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- h8300-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- ia64-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- ia64-randconfig-r002-20210519
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- m68k-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- m68k-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- m68k-randconfig-s031-20210519
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- mips-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- nds32-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- nios2-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- openrisc-randconfig-r004-20210519
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- parisc-randconfig-r034-20210519
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- powerpc-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- riscv-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- s390-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- sh-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- sh-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- sparc-allmodconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
|   |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
|   |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
|   `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used
`-- xtensa-allyesconfig
    |-- drivers-staging-media-hantro-hantro_drv.c:error:conflicting-types-for-v4l2_m2m_buf_copy_metadata
    |-- drivers-staging-media-hantro-hantro_drv.c:error:ctx-undeclared-here-(not-in-a-function)
    |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before-token
    |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-asm-or-__attribute__-before:token
    |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-if
    |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-return
    |-- drivers-staging-media-hantro-hantro_drv.c:error:expected-identifier-or-(-before-token
    |-- drivers-staging-media-hantro-hantro_drv.c:error:label-err_cancel_job-used-but-not-defined
    |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-ret
    |-- drivers-staging-media-hantro-hantro_drv.c:error:type-defaults-to-int-in-declaration-of-v4l2_m2m_buf_copy_metadata
    |-- drivers-staging-media-hantro-hantro_drv.c:warning:data-definition-has-no-type-or-storage-class
    |-- drivers-staging-media-hantro-hantro_drv.c:warning:parameter-names-(without-types)-in-function-declaration
    |-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-dst-set-but-not-used
    `-- drivers-staging-media-hantro-hantro_drv.c:warning:variable-src-set-but-not-used

elapsed time: 1917m

configs tested: 235
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                           alldefconfig
h8300                    h8300h-sim_defconfig
arc                          axs103_defconfig
sh                          rsk7269_defconfig
arm64                            alldefconfig
arm                        trizeps4_defconfig
arc                        nsimosci_defconfig
arm                         socfpga_defconfig
arm                         bcm2835_defconfig
arc                            hsdk_defconfig
powerpc                        icon_defconfig
arm                      tct_hammer_defconfig
arm                            hisi_defconfig
xtensa                  audio_kc705_defconfig
x86_64                            allnoconfig
sh                   rts7751r2dplus_defconfig
arm                          pxa3xx_defconfig
arm                         axm55xx_defconfig
powerpc                      arches_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
arc                              alldefconfig
arm                         shannon_defconfig
sh                      rts7751r2d1_defconfig
powerpc                      pasemi_defconfig
mips                        qi_lb60_defconfig
arm                          badge4_defconfig
m68k                       m5208evb_defconfig
arm                          pcm027_defconfig
sh                           se7724_defconfig
mips                    maltaup_xpa_defconfig
i386                                defconfig
arm                        magician_defconfig
sparc                       sparc32_defconfig
mips                      loongson3_defconfig
mips                           ip27_defconfig
sh                          rsk7264_defconfig
ia64                                defconfig
m68k                          sun3x_defconfig
mips                         tb0287_defconfig
sh                               allmodconfig
powerpc                 canyonlands_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                    adder875_defconfig
ia64                          tiger_defconfig
powerpc                mpc7448_hpc2_defconfig
riscv                            allyesconfig
ia64                            zx1_defconfig
arm                             pxa_defconfig
sh                          kfr2r09_defconfig
mips                           jazz_defconfig
arm                   milbeaut_m10v_defconfig
sh                            hp6xx_defconfig
arm                         hackkit_defconfig
mips                      malta_kvm_defconfig
powerpc                     ep8248e_defconfig
powerpc                      pcm030_defconfig
mips                     cu1000-neo_defconfig
mips                            gpr_defconfig
arm                         s3c2410_defconfig
arm                        spear3xx_defconfig
mips                     cu1830-neo_defconfig
arm                        shmobile_defconfig
arm                         vf610m4_defconfig
m68k                        mvme147_defconfig
mips                         cobalt_defconfig
arm                        clps711x_defconfig
sh                          sdk7786_defconfig
sh                          r7785rp_defconfig
powerpc                     asp8347_defconfig
arc                     nsimosci_hs_defconfig
powerpc                  mpc885_ads_defconfig
arc                                 defconfig
sh                           se7721_defconfig
sh                           se7705_defconfig
s390                             alldefconfig
mips                         tb0226_defconfig
m68k                          multi_defconfig
powerpc                 mpc832x_rdb_defconfig
s390                             allyesconfig
csky                                defconfig
arc                           tb10x_defconfig
sh                        edosk7705_defconfig
powerpc                   bluestone_defconfig
mips                         tb0219_defconfig
mips                           xway_defconfig
xtensa                  cadence_csp_defconfig
arm                       mainstone_defconfig
m68k                        m5307c3_defconfig
arm                       netwinder_defconfig
powerpc                       ppc64_defconfig
mips                   sb1250_swarm_defconfig
arc                      axs103_smp_defconfig
arm                           h3600_defconfig
mips                             allyesconfig
ia64                        generic_defconfig
powerpc                      ppc40x_defconfig
m68k                            q40_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                   currituck_defconfig
s390                       zfcpdump_defconfig
arm                     davinci_all_defconfig
m68k                         amcore_defconfig
arm                          pxa168_defconfig
arm                      integrator_defconfig
powerpc                     mpc5200_defconfig
xtensa                    xip_kc705_defconfig
mips                         bigsur_defconfig
m68k                             allyesconfig
x86_64                           allyesconfig
arm                          ep93xx_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                           corgi_defconfig
sh                           sh2007_defconfig
mips                      maltasmvp_defconfig
arm                        multi_v7_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
powerpc                      ppc6xx_defconfig
arc                     haps_hs_smp_defconfig
powerpc                     powernv_defconfig
sh                        apsh4ad0a_defconfig
arm                           viper_defconfig
um                             i386_defconfig
x86_64                              defconfig
powerpc                          allyesconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                     tqm5200_defconfig
arm                             ezx_defconfig
sh                          lboxre2_defconfig
powerpc                      ep88xc_defconfig
arm                             mxs_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8540_defconfig
ia64                      gensparse_defconfig
arc                              allyesconfig
arm                       omap2plus_defconfig
mips                            ar7_defconfig
mips                  decstation_64_defconfig
m68k                        stmark2_defconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210519
i386                 randconfig-a001-20210519
i386                 randconfig-a005-20210519
i386                 randconfig-a004-20210519
i386                 randconfig-a002-20210519
i386                 randconfig-a006-20210519
i386                 randconfig-a001-20210520
i386                 randconfig-a005-20210520
i386                 randconfig-a002-20210520
i386                 randconfig-a006-20210520
i386                 randconfig-a004-20210520
i386                 randconfig-a003-20210520
x86_64               randconfig-a012-20210519
x86_64               randconfig-a015-20210519
x86_64               randconfig-a013-20210519
x86_64               randconfig-a011-20210519
x86_64               randconfig-a016-20210519
x86_64               randconfig-a014-20210519
i386                 randconfig-a014-20210519
i386                 randconfig-a016-20210519
i386                 randconfig-a011-20210519
i386                 randconfig-a015-20210519
i386                 randconfig-a012-20210519
i386                 randconfig-a013-20210519
i386                 randconfig-a016-20210520
i386                 randconfig-a011-20210520
i386                 randconfig-a015-20210520
i386                 randconfig-a012-20210520
i386                 randconfig-a014-20210520
i386                 randconfig-a013-20210520
x86_64               randconfig-a001-20210520
x86_64               randconfig-a006-20210520
x86_64               randconfig-a005-20210520
x86_64               randconfig-a003-20210520
x86_64               randconfig-a004-20210520
x86_64               randconfig-a002-20210520
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210519
x86_64               randconfig-b001-20210520
x86_64               randconfig-a003-20210519
x86_64               randconfig-a004-20210519
x86_64               randconfig-a005-20210519
x86_64               randconfig-a001-20210519
x86_64               randconfig-a002-20210519
x86_64               randconfig-a006-20210519
x86_64               randconfig-a013-20210520
x86_64               randconfig-a014-20210520
x86_64               randconfig-a012-20210520
x86_64               randconfig-a016-20210520
x86_64               randconfig-a015-20210520
x86_64               randconfig-a011-20210520

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
