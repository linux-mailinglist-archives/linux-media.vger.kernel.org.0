Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398C258864
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 19:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfF0RdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 13:33:15 -0400
Received: from mga03.intel.com ([134.134.136.65]:13315 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbfF0RdP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 13:33:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 10:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,424,1557212400"; 
   d="gz'50?scan'50,208,50";a="156306609"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Jun 2019 10:33:06 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hgYGf-000Anf-L5; Fri, 28 Jun 2019 01:33:05 +0800
Date:   Fri, 28 Jun 2019 01:32:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Lukas Schneider <lukas.s.schneider@fau.de>
Cc:     kbuild-all@01.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, st5pub@yandex.ru,
        gabrielfanelli61@gmail.com, code@wizofe.uk,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Jannik Moritz <jannik.moritz@fau.de>,
        linux-kernel@i4.cs.fau.de,
        Lukas Schneider <lukas.s.schneider@fau.de>
Subject: Re: [PATCH] media: bcm2048: Macros with complex values should be
 enclosed in parentheses
Message-ID: <201906280122.9FbGo98U%lkp@intel.com>
References: <20190627121515.32029-1-lukas.s.schneider@fau.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <20190627121515.32029-1-lukas.s.schneider@fau.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lukas,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linuxtv-media/master]
[also build test ERROR on v5.2-rc6 next-20190625]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Lukas-Schneider/media-bcm2048-Macros-with-complex-values-should-be-enclosed-in-parentheses/20190628-003532
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-x074-201925 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-9) 7.4.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/staging/media/bcm2048/radio-bcm2048.c:2004:1: error: expected identifier or '(' before 'do'
    do {         \
    ^
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2033:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(power_state, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2033:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(power_state, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2034:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(mute, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2035:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(audio_route, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2036:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(dac_output, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2038:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_hi_lo_injection, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2039:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_frequency, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2040:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_af_frequency, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2041:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_deemphasis, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2042:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_rds_mask, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2043:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_best_tune_mode, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2044:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_search_rssi_threshold, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2045:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_search_mode_direction, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2046:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_search_tune_mode, unsigned int, "%u", value > 3)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2048:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2049:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_b_block_mask, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2050:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_b_block_match, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging/media/bcm2048/radio-bcm2048.c:2051:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_pi_mask, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
--
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2041:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_deemphasis, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2042:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_rds_mask, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2043:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_best_tune_mode, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2044:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_search_rssi_threshold, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2045:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_search_mode_direction, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2046:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(fm_search_tune_mode, unsigned int, "%u", value > 3)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2048:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2049:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_b_block_mask, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2050:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_b_block_match, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2051:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_pi_mask, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2052:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_pi_match, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2053:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(rds_wline, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2004:1: error: expected identifier or '(' before 'do'
    do {         \
    ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2065:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(region, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2007:3: error: expected identifier or '(' before 'while'
    } while (0)        \
      ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2065:1: note: in expansion of macro 'DEFINE_SYSFS_PROPERTY'
    DEFINE_SYSFS_PROPERTY(region, unsigned int, "%u", 0)
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c: In function 'bcm2048_sysfs_unregister_properties':
   drivers/staging//media/bcm2048/radio-bcm2048.c:2137:43: error: 'attrs' undeclared (first use in this function); did you mean 'iattr'?
      device_remove_file(&bdev->client->dev, &attrs[i]);
                                              ^~~~~
                                              iattr
   drivers/staging//media/bcm2048/radio-bcm2048.c:2137:43: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/staging//media/bcm2048/radio-bcm2048.c:33:0:
   drivers/staging//media/bcm2048/radio-bcm2048.c: In function 'bcm2048_sysfs_register_properties':
   drivers/staging//media/bcm2048/radio-bcm2048.c:2147:29: error: 'attrs' undeclared (first use in this function); did you mean 'iattr'?
     for (i = 0; i < ARRAY_SIZE(attrs); i++) {
                                ^
   include/linux/kernel.h:47:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
   In file included from include/linux/kernel.h:16:0,
                    from drivers/staging//media/bcm2048/radio-bcm2048.c:33:
>> include/linux/build_bug.h:16:45: error: bit-field '<anonymous>' width not an integer constant
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                ^
   include/linux/compiler.h:352:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2147:18: note: in expansion of macro 'ARRAY_SIZE'
     for (i = 0; i < ARRAY_SIZE(attrs); i++) {
                     ^~~~~~~~~~
   In file included from drivers/staging//media/bcm2048/radio-bcm2048.c:33:0:
   drivers/staging//media/bcm2048/radio-bcm2048.c: In function 'bcm2048_i2c_driver_probe':
   drivers/staging//media/bcm2048/radio-bcm2048.c:2630:55: error: 'attrs' undeclared (first use in this function); did you mean 'iattr'?
     bcm2048_sysfs_unregister_properties(bdev, ARRAY_SIZE(attrs));
                                                          ^
   include/linux/kernel.h:47:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
   In file included from include/linux/kernel.h:16:0,
                    from drivers/staging//media/bcm2048/radio-bcm2048.c:33:
>> include/linux/build_bug.h:16:45: error: bit-field '<anonymous>' width not an integer constant
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                ^
   include/linux/compiler.h:352:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2630:44: note: in expansion of macro 'ARRAY_SIZE'
     bcm2048_sysfs_unregister_properties(bdev, ARRAY_SIZE(attrs));
                                               ^~~~~~~~~~
   In file included from drivers/staging//media/bcm2048/radio-bcm2048.c:33:0:
   drivers/staging//media/bcm2048/radio-bcm2048.c: In function 'bcm2048_i2c_driver_remove':
   drivers/staging//media/bcm2048/radio-bcm2048.c:2651:56: error: 'attrs' undeclared (first use in this function); did you mean 'iattr'?
      bcm2048_sysfs_unregister_properties(bdev, ARRAY_SIZE(attrs));
                                                           ^
   include/linux/kernel.h:47:33: note: in definition of macro 'ARRAY_SIZE'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                    ^~~
   In file included from include/linux/kernel.h:16:0,
                    from drivers/staging//media/bcm2048/radio-bcm2048.c:33:
>> include/linux/build_bug.h:16:45: error: bit-field '<anonymous>' width not an integer constant
    #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
                                                ^
   include/linux/compiler.h:352:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
    #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                               ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_array'
    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                              ^~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2651:45: note: in expansion of macro 'ARRAY_SIZE'
      bcm2048_sysfs_unregister_properties(bdev, ARRAY_SIZE(attrs));
                                                ^~~~~~~~~~
   At top level:
   drivers/staging//media/bcm2048/radio-bcm2048.c:1988:16: warning: 'bcm2048_fm_rssi_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2064:1: note: in expansion of macro 'property_signed_read'
    property_signed_read(fm_rssi, int, "%d")
    ^~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1988:16: warning: 'bcm2048_fm_carrier_error_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2063:1: note: in expansion of macro 'property_signed_read'
    property_signed_read(fm_carrier_error, int, "%d")
    ^~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1969:16: warning: 'bcm2048_region_top_frequency_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2062:1: note: in expansion of macro 'property_read'
    property_read(region_top_frequency, "%u")
    ^~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1969:16: warning: 'bcm2048_region_bottom_frequency_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2061:1: note: in expansion of macro 'property_read'
    property_read(region_bottom_frequency, "%u")
    ^~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2010:16: warning: 'bcm2048_rds_data_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2059:1: note: in expansion of macro 'property_str_read'
    property_str_read(rds_data, BCM2048_MAX_RDS_RADIO_TEXT * 5)
    ^~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1969:16: warning: 'bcm2048_fm_rds_flags_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2058:1: note: in expansion of macro 'property_read'
    property_read(fm_rds_flags, "%u")
    ^~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2010:16: warning: 'bcm2048_rds_ps_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2056:1: note: in expansion of macro 'property_str_read'
    property_str_read(rds_ps, (BCM2048_MAX_RDS_PS + 1))
    ^~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:2010:16: warning: 'bcm2048_rds_rt_read' defined but not used [-Wunused-function]
    static ssize_t bcm2048_##prop##_read(struct device *dev,  \
                   ^
   drivers/staging//media/bcm2048/radio-bcm2048.c:2055:1: note: in expansion of macro 'property_str_read'
    property_str_read(rds_rt, (BCM2048_MAX_RDS_RT + 1))
    ^~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1243:12: warning: 'bcm2048_get_fm_best_tune_mode' defined but not used [-Wunused-function]
    static int bcm2048_get_fm_best_tune_mode(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1222:12: warning: 'bcm2048_set_fm_best_tune_mode' defined but not used [-Wunused-function]
    static int bcm2048_set_fm_best_tune_mode(struct bcm2048_device *bdev, u8 mode)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1176:12: warning: 'bcm2048_get_fm_rds_mask' defined but not used [-Wunused-function]
    static int bcm2048_get_fm_rds_mask(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1163:12: warning: 'bcm2048_set_fm_rds_mask' defined but not used [-Wunused-function]
    static int bcm2048_set_fm_rds_mask(struct bcm2048_device *bdev, u16 mask)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1145:12: warning: 'bcm2048_get_rds_pi_match' defined but not used [-Wunused-function]
    static int bcm2048_get_rds_pi_match(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1130:12: warning: 'bcm2048_set_rds_pi_match' defined but not used [-Wunused-function]
    static int bcm2048_set_rds_pi_match(struct bcm2048_device *bdev, u16 match)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1112:12: warning: 'bcm2048_get_rds_pi_mask' defined but not used [-Wunused-function]
    static int bcm2048_get_rds_pi_mask(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1099:12: warning: 'bcm2048_set_rds_pi_mask' defined but not used [-Wunused-function]
    static int bcm2048_set_rds_pi_mask(struct bcm2048_device *bdev, u16 mask)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1081:12: warning: 'bcm2048_get_rds_b_block_match' defined but not used [-Wunused-function]
    static int bcm2048_get_rds_b_block_match(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1065:12: warning: 'bcm2048_set_rds_b_block_match' defined but not used [-Wunused-function]
    static int bcm2048_set_rds_b_block_match(struct bcm2048_device *bdev,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1047:12: warning: 'bcm2048_get_rds_b_block_mask' defined but not used [-Wunused-function]
    static int bcm2048_get_rds_b_block_mask(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1032:12: warning: 'bcm2048_set_rds_b_block_mask' defined but not used [-Wunused-function]
    static int bcm2048_set_rds_b_block_mask(struct bcm2048_device *bdev, u16 mask)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:1014:12: warning: 'bcm2048_get_fm_search_tune_mode' defined but not used [-Wunused-function]
    static int bcm2048_get_fm_search_tune_mode(struct bcm2048_device *bdev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging//media/bcm2048/radio-bcm2048.c:941:12: warning: 'bcm2048_get_fm_search_mode_direction' defined but not used [-Wunused-function]

vim +2004 drivers/staging/media/bcm2048/radio-bcm2048.c

  1986	
  1987	#define property_signed_read(prop, size, mask)				\
> 1988	static ssize_t bcm2048_##prop##_read(struct device *dev,		\
  1989						struct device_attribute *attr,	\
  1990						char *buf)			\
  1991	{									\
  1992		struct bcm2048_device *bdev = dev_get_drvdata(dev);		\
  1993		size value;							\
  1994										\
  1995		if (!bdev)							\
  1996			return -ENODEV;						\
  1997										\
  1998		value = bcm2048_get_##prop(bdev);				\
  1999										\
  2000		return sprintf(buf, mask "\n", value);				\
  2001	}
  2002	
  2003	#define DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check)		\
> 2004	do {									\
  2005		property_write(prop, prop_type, mask, check)			\
  2006		property_read(prop, mask)					\
> 2007	} while (0)								\
  2008	
  2009	#define property_str_read(prop, size)					\
  2010	static ssize_t bcm2048_##prop##_read(struct device *dev,		\
  2011						struct device_attribute *attr,	\
  2012						char *buf)			\
  2013	{									\
  2014		struct bcm2048_device *bdev = dev_get_drvdata(dev);		\
  2015		int count;							\
  2016		u8 *out;							\
  2017										\
  2018		if (!bdev)							\
  2019			return -ENODEV;						\
  2020										\
  2021		out = kzalloc((size) + 1, GFP_KERNEL);				\
  2022		if (!out)							\
  2023			return -ENOMEM;						\
  2024										\
  2025		bcm2048_get_##prop(bdev, out);					\
  2026		count = sprintf(buf, "%s\n", out);				\
  2027										\
  2028		kfree(out);							\
  2029										\
  2030		return count;							\
  2031	}
  2032	
> 2033	DEFINE_SYSFS_PROPERTY(power_state, unsigned int, "%u", 0)
  2034	DEFINE_SYSFS_PROPERTY(mute, unsigned int, "%u", 0)
  2035	DEFINE_SYSFS_PROPERTY(audio_route, unsigned int, "%u", 0)
  2036	DEFINE_SYSFS_PROPERTY(dac_output, unsigned int, "%u", 0)
  2037	
  2038	DEFINE_SYSFS_PROPERTY(fm_hi_lo_injection, unsigned int, "%u", 0)
  2039	DEFINE_SYSFS_PROPERTY(fm_frequency, unsigned int, "%u", 0)
  2040	DEFINE_SYSFS_PROPERTY(fm_af_frequency, unsigned int, "%u", 0)
  2041	DEFINE_SYSFS_PROPERTY(fm_deemphasis, unsigned int, "%u", 0)
  2042	DEFINE_SYSFS_PROPERTY(fm_rds_mask, unsigned int, "%u", 0)
  2043	DEFINE_SYSFS_PROPERTY(fm_best_tune_mode, unsigned int, "%u", 0)
  2044	DEFINE_SYSFS_PROPERTY(fm_search_rssi_threshold, unsigned int, "%u", 0)
  2045	DEFINE_SYSFS_PROPERTY(fm_search_mode_direction, unsigned int, "%u", 0)
  2046	DEFINE_SYSFS_PROPERTY(fm_search_tune_mode, unsigned int, "%u", value > 3)
  2047	
  2048	DEFINE_SYSFS_PROPERTY(rds, unsigned int, "%u", 0)
  2049	DEFINE_SYSFS_PROPERTY(rds_b_block_mask, unsigned int, "%u", 0)
  2050	DEFINE_SYSFS_PROPERTY(rds_b_block_match, unsigned int, "%u", 0)
  2051	DEFINE_SYSFS_PROPERTY(rds_pi_mask, unsigned int, "%u", 0)
  2052	DEFINE_SYSFS_PROPERTY(rds_pi_match, unsigned int, "%u", 0)
  2053	DEFINE_SYSFS_PROPERTY(rds_wline, unsigned int, "%u", 0)
  2054	property_read(rds_pi, "%x")
  2055	property_str_read(rds_rt, (BCM2048_MAX_RDS_RT + 1))
  2056	property_str_read(rds_ps, (BCM2048_MAX_RDS_PS + 1))
  2057	
  2058	property_read(fm_rds_flags, "%u")
  2059	property_str_read(rds_data, BCM2048_MAX_RDS_RADIO_TEXT * 5)
  2060	
  2061	property_read(region_bottom_frequency, "%u")
> 2062	property_read(region_top_frequency, "%u")
  2063	property_signed_read(fm_carrier_error, int, "%d")
> 2064	property_signed_read(fm_rssi, int, "%d")
  2065	DEFINE_SYSFS_PROPERTY(region, unsigned int, "%u", 0)
  2066	
  2067	static struct device_attribute attrs[] = {
  2068		__ATTR(power_state, 0644, bcm2048_power_state_read,
  2069		       bcm2048_power_state_write),
  2070		__ATTR(mute, 0644, bcm2048_mute_read,
  2071		       bcm2048_mute_write),
  2072		__ATTR(audio_route, 0644, bcm2048_audio_route_read,
  2073		       bcm2048_audio_route_write),
  2074		__ATTR(dac_output, 0644, bcm2048_dac_output_read,
  2075		       bcm2048_dac_output_write),
  2076		__ATTR(fm_hi_lo_injection, 0644,
  2077		       bcm2048_fm_hi_lo_injection_read,
  2078		       bcm2048_fm_hi_lo_injection_write),
  2079		__ATTR(fm_frequency, 0644, bcm2048_fm_frequency_read,
  2080		       bcm2048_fm_frequency_write),
  2081		__ATTR(fm_af_frequency, 0644,
  2082		       bcm2048_fm_af_frequency_read,
  2083		       bcm2048_fm_af_frequency_write),
  2084		__ATTR(fm_deemphasis, 0644, bcm2048_fm_deemphasis_read,
  2085		       bcm2048_fm_deemphasis_write),
  2086		__ATTR(fm_rds_mask, 0644, bcm2048_fm_rds_mask_read,
  2087		       bcm2048_fm_rds_mask_write),
  2088		__ATTR(fm_best_tune_mode, 0644,
  2089		       bcm2048_fm_best_tune_mode_read,
  2090		       bcm2048_fm_best_tune_mode_write),
  2091		__ATTR(fm_search_rssi_threshold, 0644,
  2092		       bcm2048_fm_search_rssi_threshold_read,
  2093		       bcm2048_fm_search_rssi_threshold_write),
  2094		__ATTR(fm_search_mode_direction, 0644,
  2095		       bcm2048_fm_search_mode_direction_read,
  2096		       bcm2048_fm_search_mode_direction_write),
  2097		__ATTR(fm_search_tune_mode, 0644,
  2098		       bcm2048_fm_search_tune_mode_read,
  2099		       bcm2048_fm_search_tune_mode_write),
  2100		__ATTR(rds, 0644, bcm2048_rds_read,
  2101		       bcm2048_rds_write),
  2102		__ATTR(rds_b_block_mask, 0644,
  2103		       bcm2048_rds_b_block_mask_read,
  2104		       bcm2048_rds_b_block_mask_write),
  2105		__ATTR(rds_b_block_match, 0644,
  2106		       bcm2048_rds_b_block_match_read,
  2107		       bcm2048_rds_b_block_match_write),
  2108		__ATTR(rds_pi_mask, 0644, bcm2048_rds_pi_mask_read,
  2109		       bcm2048_rds_pi_mask_write),
  2110		__ATTR(rds_pi_match, 0644, bcm2048_rds_pi_match_read,
  2111		       bcm2048_rds_pi_match_write),
  2112		__ATTR(rds_wline, 0644, bcm2048_rds_wline_read,
  2113		       bcm2048_rds_wline_write),
  2114		__ATTR(rds_pi, 0444, bcm2048_rds_pi_read, NULL),
  2115		__ATTR(rds_rt, 0444, bcm2048_rds_rt_read, NULL),
  2116		__ATTR(rds_ps, 0444, bcm2048_rds_ps_read, NULL),
  2117		__ATTR(fm_rds_flags, 0444, bcm2048_fm_rds_flags_read, NULL),
  2118		__ATTR(region_bottom_frequency, 0444,
  2119		       bcm2048_region_bottom_frequency_read, NULL),
  2120		__ATTR(region_top_frequency, 0444,
  2121		       bcm2048_region_top_frequency_read, NULL),
  2122		__ATTR(fm_carrier_error, 0444,
  2123		       bcm2048_fm_carrier_error_read, NULL),
  2124		__ATTR(fm_rssi, 0444,
  2125		       bcm2048_fm_rssi_read, NULL),
  2126		__ATTR(region, 0644, bcm2048_region_read,
  2127		       bcm2048_region_write),
  2128		__ATTR(rds_data, 0444, bcm2048_rds_data_read, NULL),
  2129	};
  2130	
  2131	static int bcm2048_sysfs_unregister_properties(struct bcm2048_device *bdev,
  2132						       int size)
  2133	{
  2134		int i;
  2135	
  2136		for (i = 0; i < size; i++)
> 2137			device_remove_file(&bdev->client->dev, &attrs[i]);
  2138	
  2139		return 0;
  2140	}
  2141	
  2142	static int bcm2048_sysfs_register_properties(struct bcm2048_device *bdev)
  2143	{
  2144		int err = 0;
  2145		int i;
  2146	
> 2147		for (i = 0; i < ARRAY_SIZE(attrs); i++) {
  2148			if (device_create_file(&bdev->client->dev, &attrs[i]) != 0) {
  2149				dev_err(&bdev->client->dev,
  2150					"could not register sysfs entry\n");
  2151				err = -EBUSY;
  2152				bcm2048_sysfs_unregister_properties(bdev, i);
  2153				break;
  2154			}
  2155		}
  2156	
  2157		return err;
  2158	}
  2159	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--0OAP2g/MAC+5xKAE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--0OAP2g/MAC+5xKAE--
