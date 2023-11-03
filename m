Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18157DFD7C
	for <lists+linux-media@lfdr.de>; Fri,  3 Nov 2023 01:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjKCAK7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 20:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjKCAK6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 20:10:58 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37359136
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 17:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698970252; x=1730506252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LHzgKKHceDmVtvjW3XeBFtz6uIf7ilQ87eyEZtqfgc=;
  b=fq8qV5G9pyyp/GTCbMDFXiIIpfn51ri1qkTgTGl/TyS57/sPg9c4JJ2f
   JjzdmMw9bz8wAQrnbYH5SSx20WlyNyir+CI0wFopskldwhcoZGRxdjX9b
   aSpkwNkIBM2AJyZ1e1nEAH8gXEAquvtogdTND87c9UrR8CrFTCS6r/A7L
   k7/uuWA7jy9uQrj8r67J8bLp/EcPkpmvpeJ5DK3kJLg9V8Ny6zeHDAIpn
   v3CDvgOqH7fvYkb6BLn88FXfEq9ODBvAUvS+f0xL3J6UTexBcJyXXEcfT
   qqj0R+d2CoHcEAA3uOqKvmHTWwDWs2cgrZFhI9IxFRxLLiKjn9VY3G6IN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391717067"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="391717067"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885055082"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="885055082"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Nov 2023 17:10:49 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qyhlv-00022e-0b;
        Fri, 03 Nov 2023 00:10:47 +0000
Date:   Fri, 3 Nov 2023 08:08:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [sailus-media-tree:acpi-crs-csi2 4/11]
 drivers/acpi/property.c:956:38: warning: variable 'device' is uninitialized
 when used here
Message-ID: <202311030838.HbKmH9KW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://linuxtv.org/sailus/media_tree.git acpi-crs-csi2
head:   28a8d46f3d9e63f1cf251fbbc0d6d51b9b76d8a8
commit: d75e54c0deb2785a0b11d27514e53f27a98b6d91 [4/11] ACPI: property: Support using strings in reference properties
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231103/202311030838.HbKmH9KW-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030838.HbKmH9KW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030838.HbKmH9KW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/property.c:956:38: warning: variable 'device' is uninitialized when used here [-Wuninitialized]
                           args->fwnode = acpi_fwnode_handle(device);
                                                             ^~~~~~
   drivers/acpi/property.c:920:28: note: initialize the variable 'device' to silence this warning
           struct acpi_device *device;
                                     ^
                                      = NULL
   1 warning generated.


vim +/device +956 drivers/acpi/property.c

   875	
   876	/**
   877	 * __acpi_node_get_property_reference - returns handle to the referenced object
   878	 * @fwnode: Firmware node to get the property from
   879	 * @propname: Name of the property
   880	 * @index: Index of the reference to return
   881	 * @num_args: Maximum number of arguments after each reference
   882	 * @args: Location to store the returned reference with optional arguments
   883	 *	  (may be NULL)
   884	 *
   885	 * Find property with @name, verifify that it is a package containing at least
   886	 * one object reference and if so, store the ACPI device object pointer to the
   887	 * target object in @args->adev.  If the reference includes arguments, store
   888	 * them in the @args->args[] array.
   889	 *
   890	 * If there's more than one reference in the property value package, @index is
   891	 * used to select the one to return.
   892	 *
   893	 * It is possible to leave holes in the property value set like in the
   894	 * example below:
   895	 *
   896	 * Package () {
   897	 *     "cs-gpios",
   898	 *     Package () {
   899	 *        ^GPIO, 19, 0, 0,
   900	 *        ^GPIO, 20, 0, 0,
   901	 *        0,
   902	 *        ^GPIO, 21, 0, 0,
   903	 *     }
   904	 * }
   905	 *
   906	 * Calling this function with index %2 or index %3 return %-ENOENT. If the
   907	 * property does not contain any more values %-ENOENT is returned. The NULL
   908	 * entry must be single integer and preferably contain value %0.
   909	 *
   910	 * Return: %0 on success, negative error code on failure.
   911	 */
   912	int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
   913		const char *propname, size_t index, size_t num_args,
   914		struct fwnode_reference_args *args)
   915	{
   916		const union acpi_object *element, *end;
   917		const union acpi_object *obj;
   918		const struct acpi_device_data *data;
   919		struct fwnode_handle *ref_fwnode;
   920		struct acpi_device *device;
   921		int ret, idx = 0;
   922	
   923		data = acpi_device_data_of_node(fwnode);
   924		if (!data)
   925			return -ENOENT;
   926	
   927		ret = acpi_data_get_property(data, propname, ACPI_TYPE_ANY, &obj);
   928		if (ret)
   929			return ret == -EINVAL ? -ENOENT : -EINVAL;
   930	
   931		switch (obj->type) {
   932		case ACPI_TYPE_LOCAL_REFERENCE:
   933			/* Plain single reference without arguments. */
   934			if (index)
   935				return -ENOENT;
   936	
   937			device = acpi_fetch_acpi_dev(obj->reference.handle);
   938			if (!device)
   939				return -EINVAL;
   940	
   941			if (args) {
   942				args->fwnode = acpi_fwnode_handle(device);
   943				args->nargs = 0;
   944			}
   945	
   946			return 0;
   947		case ACPI_TYPE_STRING:
   948			if (index)
   949				return -ENOENT;
   950	
   951			ref_fwnode = acpi_parse_string_ref(fwnode, obj->string.pointer);
   952			if (!ref_fwnode)
   953				return -EINVAL;
   954	
   955			if (args) {
 > 956				args->fwnode = acpi_fwnode_handle(device);
   957				args->nargs = 0;
   958			}
   959	
   960			return 0;
   961		case ACPI_TYPE_PACKAGE:
   962			/*
   963			 * If it is not a single reference, then it is a package of
   964			 * references, followed by number of ints as follows:
   965			 *
   966			 *  Package () { REF, INT, REF, INT, INT }
   967			 *
   968			 * Here, REF may be either a local reference or a string. The
   969			 * index argument is then used to determine which reference the
   970			 * caller wants (along with the arguments).
   971			 */
   972			break;
   973		default:
   974			return -EINVAL;
   975		}
   976	
   977		if (index >= obj->package.count)
   978			return -ENOENT;
   979	
   980		element = obj->package.elements;
   981		end = element + obj->package.count;
   982	
   983		while (element < end) {
   984			switch (element->type) {
   985			case ACPI_TYPE_LOCAL_REFERENCE:
   986				device = acpi_fetch_acpi_dev(element->reference.handle);
   987				if (!device)
   988					return -EINVAL;
   989	
   990				element++;
   991	
   992				ret = acpi_get_ref_args(idx == index ? args : NULL,
   993							acpi_fwnode_handle(device),
   994							&element, end, num_args);
   995				if (ret < 0)
   996					return ret;
   997	
   998				if (idx == index)
   999					return 0;
  1000	
  1001				break;
  1002			case ACPI_TYPE_STRING:
  1003				ref_fwnode = acpi_parse_string_ref(fwnode,
  1004								   element->string.pointer);
  1005				if (!ref_fwnode)
  1006					return -EINVAL;
  1007	
  1008				element++;
  1009	
  1010				ret = acpi_get_ref_args(idx == index ? args : NULL,
  1011							ref_fwnode, &element, end,
  1012							num_args);
  1013				if (ret < 0)
  1014					return ret;
  1015	
  1016				if (idx == index)
  1017					return 0;
  1018	
  1019				break;
  1020			case ACPI_TYPE_INTEGER:
  1021				if (idx == index)
  1022					return -ENOENT;
  1023				element++;
  1024				break;
  1025			default:
  1026				return -EINVAL;
  1027			}
  1028	
  1029			idx++;
  1030		}
  1031	
  1032		return -ENOENT;
  1033	}
  1034	EXPORT_SYMBOL_GPL(__acpi_node_get_property_reference);
  1035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
